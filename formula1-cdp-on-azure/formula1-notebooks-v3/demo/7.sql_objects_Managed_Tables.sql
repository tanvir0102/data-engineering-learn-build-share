-- Databricks notebook source
-- MAGIC %md
-- MAGIC ##### Learning Objective
-- MAGIC 1. Create Managed table using Python
-- MAGIC 2. Create Managed table using SQL
-- MAGIC 3. Effect of dropping a managed table
-- MAGIC 4. Describe table
-- MAGIC

-- COMMAND ----------

-- MAGIC %run "../includes/configuration"

-- COMMAND ----------

-- MAGIC %python
-- MAGIC %run "../set-up/mount_adls_containers"

-- COMMAND ----------

-- MAGIC %python
-- MAGIC race_results_df = spark.read.parquet(f"{presentation_folder_path}/race_results")

-- COMMAND ----------

-- MAGIC %python
-- MAGIC display(race_results_df)

-- COMMAND ----------

USE DATABASE demo;

-- COMMAND ----------

-- MAGIC %python
-- MAGIC race_results_df.write.format("parquet").saveAsTable("demo.race_results_python")

-- COMMAND ----------


