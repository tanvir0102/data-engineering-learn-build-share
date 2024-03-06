# Databricks notebook source
# MAGIC %md
# MAGIC #### Access Azure Data Lake using access keys
# MAGIC 1. Set the spark config fs.azure.account.key
# MAGIC 1. List files from demo container
# MAGIC 1. Read data from circuits.csv file

# COMMAND ----------

spark.conf.set(
    "fs.azure.account.key.formula1dl2024a.dfs.core.windows.net",
    "OSoFbsDpxF+IZclPFo+E2B3E2zFl3NPZmPr3k2Upey+nKJOebyAf4hYP/+QKRF6uWEkGJMs8y89s+ASt4vzg+g==")

# COMMAND ----------

display(dbutils.fs.ls("abfss://demo@formula1dl2024a.dfs.core.windows.net"))

# COMMAND ----------

display(spark.read.csv("abfss://demo@formula1dl2024a.dfs.core.windows.net/circuits.csv"))

# COMMAND ----------


