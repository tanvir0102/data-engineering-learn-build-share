-- Databricks notebook source
CREATE TABLE managed_default
  (width INT, length INT, height INT)

-- COMMAND ----------

INSERT INTO managed_default
  VALUES(3 INT, 2 INT, 1 INT)

-- COMMAND ----------

DESCRIBE EXTENDED managed_default

-- COMMAND ----------

CREATE TABLE external_default
  (width INT, length INT, height INT)
LOCATION 'dbfs:/mnt/demo/external_default';

-- COMMAND ----------

INSERT INTO external_default
  VALUES(3 INT, 2 INT, 1 INT)

-- COMMAND ----------

DESCRIBE EXTENDED external_default

-- COMMAND ----------

DROP TABLE managed_default

-- COMMAND ----------

DROP TABLE external_default

-- COMMAND ----------

-- MAGIC %fs ls 'dbfs:/mnt/demo/external_default'

-- COMMAND ----------

CREATE SCHEMA new_default

-- COMMAND ----------

DESCRIBE DATABASE EXTENDED new_default

-- COMMAND ----------

USE new_default;

CREATE TABLE managed_new_default
  (width INT, length INT, height INT);
INSERT INTO managed_new_default
  VALUES(3 INT, 2 INT, 1 INT);
---------------------------------------------------------------
CREATE TABLE external_new_default
  (width INT, length INT, height INT)
LOCATION 'dbfs:/mnt/demo/external_default';

INSERT INTO external_new_default
  VALUES(3 INT, 2 INT, 1 INT);


-- COMMAND ----------

DESCRIBE EXTENDED managed_new_default

-- COMMAND ----------

DESCRIBE EXTENDED external_new_default

-- COMMAND ----------

DROP TABLE managed_new_default;
DROP TABLE external_new_default

-- COMMAND ----------

CREATE SCHEMA custom
LOCATION 'dbfs:/shared/schemas/custom.db'

-- COMMAND ----------

DESCRIBE DATABASE cus
