# Jenkins CI/CD pipeline with GitHub webhook for Docker app deployment

This comprehensive guide walks you through the process of establishing a robust Continuous Integration and Continuous Deployment (CI/CD) pipeline using Jenkins, seamlessly integrated with GitHub webhooks, for the deployment of Dockerized applications on Amazon Web Services (AWS) EC2 instances. This setup utilizes the declarative pipeline approach, ensuring clarity and maintainability in your deployment process.

## Prerequisites
- An AWS account
- Basic understanding of AWS services
- Basic knowledge of Git and GitHub
- Familiarity with Jenkins and Docker concepts

## Step 1: Create an EC2 Instance
1. Log in to the AWS Management Console.
2. Navigate to the EC2 Dashboard.
3. Launch a new instance with the following specifications:
   - Name: jenkins-server
   - AMI: Ubuntu
   - Instance type: t2.micro (free tier)
   - Key pair: Create a new key pair (e.g., docker.pem)
   - Security group: Allow HTTP and HTTPS traffic
4. Click "Launch Instance" and download the .pem file.

## Step 2: Connect to the EC2 Instance
1. Open your terminal and navigate to the directory containing the downloaded .pem file.
2. Use SSH to connect to the EC2 instance using the command provided in the AWS console.

## Step 3: Generate SSH Keys
1. In the terminal connected to the EC2 instance, run the command `ssh-keygen`.
2. This will generate public and private SSH keys (`id_rsa` and `id_rsa.pub`).

## Step 4: Install Jenkins and Docker
1. Install Jenkins and Docker on the EC2 instance by following the official documentation for Ubuntu.
2. Verify the installations by running `jenkins --version` and `docker --version`.

## Step 5: Configure Security Group
1. Allow inbound traffic on ports 8080 and 8001 in the security group associated with the EC2 instance.

## Step 6: Access Jenkins Portal
1. Use the public IP of the EC2 instance to access the Jenkins portal in your web browser (e.g., http://<public_ip>:8080).
2. Follow the setup process to obtain the initial administrator password.

## Step 7: Install Suggested Plugins
1. Jenkins will prompt to install suggested plugins during setup. Click "Install Suggested Plugins" to proceed.

## Step 8: Create Admin User
1. Follow the on-screen instructions to create the first admin user for Jenkins.

## Step 9: Create a Declarative Pipeline Project
1. From the Jenkins dashboard, click "New Item".
2. Enter the project name (e.g., todo-app) and select "Pipeline".
3. Click "Ok" to create the project.

## Step 10: Configure Pipeline Script
1. In the project configuration, select "Pipeline script from SCM".
2. Choose Git as SCM and provide the repository URL and credentials if required.
3. Specify the Jenkinsfile path if it's not in the repository root.

## Step 11: Configure GitHub Webhook
1. In the GitHub repository settings, configure a webhook with the payload URL `http://<public_ip>:8080/github-webhook/`.
2. Select "Just the push event" for webhook trigger.

## Step 12: Save Configured Project
1. Save the project configuration in Jenkins.

## Step 13: Test CI/CD Pipeline
1. Make changes to the code in the GitHub repository and push them.
2. The changes should trigger Jenkins to automatically build and deploy the updated application.

## Step 14: Monitor CI/CD Pipeline
1. Use the Jenkins dashboard to monitor the CI/CD pipeline's execution.
2. Review build logs and deployment status to ensure everything is running smoothly.

## Step 15: Scale and Optimize
1. As your application grows, consider scaling your infrastructure and optimizing the CI/CD pipeline for better performance and efficiency.
