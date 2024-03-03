# Databricks notebook source
# MAGIC %md
# MAGIC ## Ingest constructors.json file

# COMMAND ----------

# MAGIC %md
# MAGIC #### Step 1 - Read JSON file using the spark dataframe reader

# COMMAND ----------

constructors_schema = "constructorId INT, constructorRef STRING, name STRING, nationality STRING, url STRING"

# COMMAND ----------

constructors_df = spark.read \
.schema(constructors_schema) \
.json("/mnt/formula1dl2024a/raw/constructors.json")

# COMMAND ----------

# MAGIC %md
# MAGIC #### Step 2 - Drop unwanted columns from the dataframe

# COMMAND ----------

from pyspark.sql.functions import col

# COMMAND ----------

constructors_dropped_df = constructors_df.drop(col('url'))

# COMMAND ----------

# MAGIC %md
# MAGIC #### Step 3 - Rename columns and add ingestion date

# COMMAND ----------

from pyspark.sql.functions import current_timestamp

# COMMAND ----------

constructors_final_df = constructors_dropped_df.withColumnRenamed("constructorId", "constructor_id") \
                                                .withColumnRenamed("constructorRef", "constructor_ref") \
                                                .withColumn("ingestion_date", current_timestamp())

# COMMAND ----------

# MAGIC %md
# MAGIC #### Step 4 - Write data to datalake as parquet

# COMMAND ----------

constructors_final_df.write.mode("overwrite").parquet("/mnt/formula1dl2024a/processed/constructors")

# COMMAND ----------


