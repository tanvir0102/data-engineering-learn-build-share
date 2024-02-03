# Databricks notebook source
# MAGIC %md
# MAGIC ## Ingest circuits.csv file

# COMMAND ----------

# MAGIC %run "../includes/configuration"

# COMMAND ----------

# MAGIC %run "../includes/common_functions"

# COMMAND ----------

# MAGIC %md
# MAGIC #### Step 1 - Read CSV file using the spark dataframe reader

# COMMAND ----------

from pyspark.sql.types import StructType, StructField, IntegerType, StringType, DoubleType

# COMMAND ----------

circuits_schema = StructType(fields=[StructField("circuitId", IntegerType(), False),
                                     StructField("circuitRef", StringType(), True),
                                     StructField("name", StringType(), True),
                                     StructField("location", StringType(), True),
                                     StructField("country", StringType(), True),
                                     StructField("lat", DoubleType(), True),
                                     StructField("lag", DoubleType(), True),
                                     StructField("alt", IntegerType(), True),
                                     StructField("url", StringType(), True)
])

# COMMAND ----------

circuits_df = spark.read \
.option("header",True) \
.schema(circuits_schema) \
.csv(f"{raw_forder_path}/circuits.csv")

# COMMAND ----------

# MAGIC %md
# MAGIC #### Step 2 - Select only required columns

# COMMAND ----------

from pyspark.sql.functions import col

# COMMAND ----------

circuits_selected_df = circuits_df.select(col("circuitId"), col("circuitRef"), col("name"), col("location"), col("country"), col("lat"), col("lag"), col("alt"))

# COMMAND ----------

# MAGIC %md
# MAGIC #### Step 3 - Rename the columns as required

# COMMAND ----------

circuits_renamed_df = circuits_selected_df.withColumnRenamed("circuitId", "circuit_id") \
    .withColumnRenamed("circuitRef", "circuit_ref") \
    .withColumnRenamed("lat", "latitude") \
    .withColumnRenamed("lag", "longitude") \
    .withColumnRenamed("alt", "altitude")

# COMMAND ----------

# MAGIC %md
# MAGIC #### Step 4 - Add ingestion date to the dataframe

# COMMAND ----------

circuits_final_df = add_ingestion_date(circuits_renamed_df)

# COMMAND ----------

# MAGIC %md
# MAGIC #### Step 5 - Write data to datalake as parquet

# COMMAND ----------

circuits_final_df.write.mode("overwrite").parquet(f"{processed_forlder_path}/circuits")

# COMMAND ----------


