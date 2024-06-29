# Terraforms
Building EC2 with Terraforms

What is Terraform?
Terraform is a powerful Infrastructure as Code (IaC) software tool offered by HashiCorp. It facilitates provisioning and managing your infrastructure on-prem and in the cloud. It can be easily extended with the help of its plugin-based architecture.

What is Terraform Used For?
Terraform can be connected with different infrastructure hosts and achieve complex management scenarios and compliance across multiple clouds. Its configuration can be easily packaged, shared, and reused in the form of Terraform modules.

Infrastructure as Code (IaC)
Traditionally, the process of preparing a Windows or Linux server for your lab or data center consisted of several steps involving mouse clicks, running scripts, and manually configuring different aspects such as storage and networking. Doing this at scale for hundreds or thousands of servers becomes increasingly complex and error-prone.

IaC makes this process much easier by allowing you to define and provision your infrastructure with the help of a declarative language. With this approach, you can gain consistency, repeatability, and enhanced reliability. 

In addition to day one infrastructure setup, this approach also helps with the management of any changes that happen to your infrastructure along the way, commonly referred to as drift management. (If you’re interested in how to manage Terraform workflows at scale, see: How to Manage Terraform at Scale)

Other IaC tools include Cloud Formation Templates (CFT) for AWS, Azure Resource Manager (ARM) templates for Microsoft Azure, and Deployment Manager for Google Cloud.

How Does Terraform Work?
Terraform Workflow
A typical Terraform workflow will consist of the following steps:

Step 1. Write 
Declare your infrastructure resources as code in Hashicorp Configuration Language (HCL). 

Step 2. Review the Plan
Terraform will display a plan to add or remove resources based on the comparison of your declared infrastructure and the current state of any existing resources.

Step 3. Apply
  init          Prepare your working directory for other commands
  validate      Check whether the configuration is valid
  plan          Show changes required by the current configuration
  apply         Create or update infrastructure
  Destory       Destroy previously-created infrastructure


# terraform_demo

Terraform Concepts:
  - Providers
  - Resource
  - Variables (Arguments)
  - Outputs (Attributes)

Terraform Installation:
  - Download the zip file
  - Extract it to c:\terraform
  - Add the terraform installation location to the PATH environment variable.
  - Git Bash Terminal and check the 'terraform version'

AWS Provider Setup:
  - Download & Install AWS CLI
  - Open Git Bash Terminal and check the 'aws version'
  - Setup the AWS CLI
  - Configure AWS by using 'aws configure' command
  - 'Access Key' and 'Secret Key' has to be setup

Agenda:
  - Launch EC2 instance using terraform.
    - AMI
    - Type of Instance

Terraform:
  - Provider: AWS
  - Resource: EC2 Instance
  - Variables: 
    - ami
    - instnace type
    - sg
      - Create custom SG.
    - key pair
    - userdata
  - Outputs:
      - Public IP Address
  - Data Type 

Editor:
  - VS Code Editor
    - Download file and Install
    - Open the VS code editor -> Open the Folder
    - 

Terraform Workflow:
  - Code -> Plan -> apply
  - destroy
