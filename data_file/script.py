import sys
import logging
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Initialize logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger()

# Get job arguments
args = getResolvedOptions(sys.argv, ['JOB_NAME'])

# Initialize SparkContext, GlueContext, and SparkSession
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

# Create Glue job
job = Job(glueContext)
job.init(args['JOB_NAME'], args)

try:
    # Script generated for node AWS Glue Data Catalog
    logger.info("Reading from Glue catalog...")
    AWSGlueDataCatalog_node = glueContext.create_dynamic_frame.from_catalog(
        database="prod-org-report",  # Ensure this database exists in the Glue catalog
        table_name="tutorial_source_data_bucket_om1",  # Correct table name
        transformation_ctx="AWSGlueDataCatalog_node"
    )
    
    # Script generated for node Change Schema
    logger.info("Applying schema transformation...")
    ChangeSchema_node = ApplyMapping.apply(
        frame=AWSGlueDataCatalog_node, 
        mappings=[
            ("index", "long", "index", "long"), 
            ("organization id", "string", "organization id", "string"), 
            ("name", "string", "name", "string"), 
            ("website", "string", "website", "string"), 
            ("country", "string", "country", "string"), 
            ("description", "string", "description", "string"), 
            ("founded", "long", "founded", "long"), 
            ("industry", "string", "industry", "string"), 
            ("number of employees", "long", "number of employees", "long")
        ], 
        transformation_ctx="ChangeSchema_node"
    )

    # Script generated for node Amazon S3
    logger.info("Writing to S3...")
    AmazonS3_node = glueContext.write_dynamic_frame.from_options(
        frame=ChangeSchema_node, 
        connection_type="s3", 
        format="csv", 
        connection_options={
            "path": "s3://tutorial-target-data-bucket-om1",  # Target S3 bucket for the transformed data
            "partitionKeys": []}, 
        transformation_ctx="AmazonS3_node"
    )

    # Commit the job
    job.commit()
    logger.info("Job completed successfully.")

except Exception as e:
    logger.error("An error occurred: %s", e)
    job.commit()
