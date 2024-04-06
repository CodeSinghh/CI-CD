# Jenkins CI/CD pipeline with GitHub webhook for Docker app deployment

This comprehensive guide walks you through the process of establishing a robust Continuous Integration and Continuous Deployment (CI/CD) pipeline using Jenkins, seamlessly integrated with GitHub webhooks, for the deployment of Dockerized applications on Amazon Web Services (AWS) EC2 instances. This setup utilizes the declarative pipeline approach, ensuring clarity and maintainability in your deployment process.
# Setting Up Jenkins on AWS EC2 Instance

## Step-by-Step Guide

### Step 1: Create an EC2 Instance
1. Log in to the AWS Management Console.
2. Navigate to the EC2 Dashboard.
3. Launch a new instance named "jenkins-server" with the following specifications:
   - AMI: Ubuntu
   - Instance type: t2.micro (free tier)
   - Key pair: Create a new key pair (e.g., docker.pem)
   - Security group: Allow HTTP and HTTPS traffic
4. Download the .pem file associated with the key pair.
5. Click on "Launch Instance".

### Step 2: Connect to the EC2 Instance
1. Copy the SSH command from the EC2 instance details in the AWS console.
2. Open a terminal and navigate to the directory containing the downloaded .pem file.
3. Paste the copied SSH command in the terminal and hit Enter.

### Step 3: Generate SSH Keys
1. In the terminal connected to the EC2 instance, run the command `ssh-keygen`.
2. This will generate public and private SSH keys (`id_rsa` and `id_rsa.pub`).

### Step 4: Install Jenkins and Docker
1. Follow the official documentation for installing Jenkins on Ubuntu from [here](https://www.jenkins.io/doc/book/installing/linux/).
2. Additionally, install Docker on the machine using the command `sudo apt install docker.io`.
   
### Step 5: Check Installation
1. Verify Jenkins installation by running `jenkins --version` in the terminal.
2. Verify Docker installation by running `docker --version`.

### Step 6: Configure Security Group
1. In the AWS console, navigate to the security group associated with the EC2 instance.
2. Allow inbound traffic on ports 8080 and 8001.

### Step 7: Access Jenkins Portal
1. Copy the Public IP of the EC2 instance from the AWS console.
2. Paste the IP address in a web browser followed by port 8080 (e.g., `http://<public_ip>:8080`).

### Step 8: Obtain Administrator Password
1. Access the Jenkins portal and follow the setup process.
2. To obtain the initial administrator password, run `cat /var/lib/jenkins/secrets/initialAdminPassword` on the EC2 instance.

### Step 9: Paste Administrator Password and Install Suggested Plugins
1. Paste the obtained initial administrator password in the "Administrator Password" field in the Jenkins setup wizard.
2. Click on "Install Suggested Plugins".

### Step 10: Install Suggested Plugins
1. Wait for Jenkins to install the suggested plugins automatically.

### Step 11: Create First Admin User
1. After the plugin installation is complete, Jenkins will prompt to create the first admin user.
2. Follow the on-screen instructions to add the necessary details for the admin user.

### Step 12: Fill Up Description
1. Once the admin user is created, Jenkins homepage will be displayed.
2. Proceed to fill up the necessary description or details for your Jenkins setup.

### Step 13: Create a CI/CD Pipeline
1. To create a new CI/CD pipeline, navigate to the Jenkins Dashboard.
2. Click on "New Item".

### Step 14: Add Project Details
1. Enter the name of the project as "todo-app".
2. Select the project type as "Freestyle project".
3. Click "Ok" to proceed.

### Step 15: Add Description
1. Fill up the description for the project as required.

### Step 16: Configure Source Code Management
1. Under the project configuration, select "Git" as the source code management system.
2. Add the repository URL and credentials if required.

### Step 17: Save Configuration
1. Save the project configuration by clicking on the "Save" or "Apply" button.

### Step 18: Verify Credential Addition
1. Verify that the repository URL and credentials are correctly added for accessing the source code.
2. If credentials are not added, ensure to add them to enable Jenkins to fetch code from the Git repository.

### Step 19: Add Build Step
1. Under the project configuration, select "Execute Shell" as the build step.
2. Write the necessary shell commands to build a Docker image and create a container from the Docker image.

### Step 20: Trigger Build
1. Click on "Build Now" to trigger the build process.
2. Monitor the build progress in the build history.

### Step 21: Check Output Console
1. Review the output console to monitor the build process and identify any errors or issues.

### Step 22: Access Live Web App
1. After a successful build, open a web browser.
2. Enter the following URL, replacing `<public_ip_of_ec2>` with the public IP address of your EC2 instance: `http://<public_ip_of_ec2>:8001`.
3. This will allow you to access the live web application deployed using the CI/CD pipeline.

### Step 23: Configure GitHub Webhook (Part 1)
1. To enable automatic triggering of the pipeline on code commits, configure the project again.
2. Add the following details:
   - Build Trigger: GitHub hook trigger for GitScm polling.
   - Description: GitHub webhook integration.

### Step 24: Install Git Integration Plugin
1. Navigate to "Manage Jenkins" > "Manage Plugins" > "Available" tab.
2. Search for the "Git Integration" plugin and install it.

### Step 25: Add SSH Key to GitHub
1. Go to GitHub > Settings > SSH and GPG Keys > New SSH Key.
2. Add details as follows:
   - Title: dsingh993252@gmail.com
   - Key type: <public_key>
3. Copy the content of the `id_rsa.pub` file and paste it as the SSH key.

### Step 26: Configure SSH Key in GitHub
1. Open the `id_rsa.pub` file and copy its content (public key).
2. Add the SSH key to GitHub as per the instructions provided in step 27.

### Step 27: Configure Webhook in GitHub
1. In the GitHub repository settings, navigate to Webhooks.
2. Add a new webhook with the following details:
   - Payload URL: `http://<public_ip_of_ec2>:8080/github-webhook/`
   - Content Type: `application/json`
   - Select "Just the push event" for webhook trigger.
   - Set Active to true.
3. Click "Add Webhook" to save the configuration.

### Step 28: Save Configured Project
1. Save the project configuration in Jenkins.

### Step 29: Test Pipeline
1. Make changes to the code in the GitHub repository and push them.
2. The pipeline should automatically trigger, and the new code will be deployed to the live web application.

### Step 30: Verify Deployment
1. After the pipeline runs successfully, verify that the changes are reflected in the live web application.


