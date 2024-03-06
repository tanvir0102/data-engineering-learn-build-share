# Databricks notebook source
# MAGIC %md
# MAGIC #### Access Azure Data Lake using SAS Token
# MAGIC 1. Set the spark config for SAS Token
# MAGIC 1. List files from demo container
# MAGIC 1. Read data from circuits.csv file

# COMMAND ----------

spark.conf.set("fs.azure.account.auth.type.formula1dl2024a.dfs.core.windows.net", "SAS")
spark.conf.set("fs.azure.sas.token.provider.type.formula1dl2024a.dfs.core.windows.net", "org.apache.hadoop.fs.azurebfs.sas.FixedSASTokenProvider")
spark.conf.set("fs.azure.sas.fixed.token.formula1dl2024a.dfs.core.windows.net", "sv=2022-11-02&ss=bfqt&srt=sco&sp=rwdlacupyx&se=2024-03-07T09:25:59Z&st=2024-03-06T01:25:59Z&spr=https&sig=uGiBjUKxKmyx5JygMJpEbqylX1JyTidwvLHSwU5mgYM%3D")

# COMMAND ----------

display(dbutils.fs.ls("abfss://demo@formula1dl2024a.dfs.core.windows.net"))

# COMMAND ----------

display(spark.read.csv("abfss://demo@formula1dl2024a.dfs.core.windows.net/circuits.csv"))

# COMMAND ----------


