-- data model looks like this

-- id,name,salary
-- 1,aakarsh,100000
-- 2,aditya,1200000,
-- 3,abhishek,100000,
-- 4,prakhar,21000



from pyspark.sql import SparkSession
from pyspark.sql.functions import col, dense_rank
from pyspark.sql.window import Window

spark = SparkSession.builder.getOrCreate()

file_path = "/FileStore/tables/highest_salary.csv"

# Read the data from the file into a DataFrame
df = spark.read.csv(file_path, header=True, inferSchema=True)

# Ensure 'Salary' is of numeric type (adjust as needed based on your schema)
df = df.withColumn("Salary", col("Salary").cast("double"))

# Define the window specification
window_spec = Window.orderBy(col("Salary").desc())

# Apply row_number to rank salaries
df_ranked = df.withColumn("Rank", dense_rank().over(window_spec))
# df_ranked.show()

# Filter for the second highest salary
second_highest_salary_df = df_ranked.filter(col("Rank") == 2).select("name","Salary")

# Show result
second_highest_salary_df.show()

