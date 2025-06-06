﻿# 🚀 Automated S3 Data ETL Pipeline using AWS Glue & Terraform

This project demonstrates the design and deployment of a fully automated, serverless ETL pipeline using **AWS Glue** for data transformation and **Terraform** for infrastructure provisioning. It processes raw data from an Amazon S3 bucket, transforms it using PySpark in AWS Glue, and stores the refined output in a destination S3 bucket — all built and deployed via Infrastructure as Code.

## 🔧 Tech Stack
- **AWS Glue** – Managed ETL service for data transformation  
- **Amazon S3** – Data lake storage for raw and transformed data  
- **Terraform** – Infrastructure as Code (IaC) for provisioning AWS resources  
- **AWS IAM** – Role-based access control for secure resource access  
- **PySpark** – ETL scripting language for AWS Glue jobs  

## 🧱 Architecture Overview
  ![image](https://github.com/user-attachments/assets/3f14d1b4-e33d-4637-a619-aa9b642cd1d2)


## 🛠️ Features
- ✅ End-to-end ETL pipeline with no manual intervention  
- ✅ Automated provisioning of Glue Jobs, Crawlers, IAM Roles, S3 Buckets via Terraform  
- ✅ Secure access using least privilege IAM policies  
- ✅ Scalable, serverless architecture with low operational overhead  
- ✅ Modular and reusable Terraform codebase  

## Upload Your Data and Script

1. Upload raw input data to the source S3 bucket.

2. Ensure the PySpark script is in the code bucket.

## Trigger the Crawler and Glue Job.

1. Start the AWS Glue Crawler to update the Data Catalog.

2. Run the Glue Job manually or automate using triggers.

## 📊 Use Cases
Industry-Level Use Cases

1. Data Warehousing.
2. Data Lakes.
3. ETL for Business Intelligence.
4. Log Processing.

## Why This Glue Pipeline is Required.

1. Scalability
2. Automation
3. Cost-Effectiveness.
4. Flexibility.

