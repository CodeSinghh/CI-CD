# Jenkins CI/CD pipeline with GitHub webhook for Docker app deployment

This comprehensive guide walks you through the process of establishing a robust Continuous Integration and Continuous Deployment (CI/CD) pipeline using Jenkins, seamlessly integrated with GitHub webhooks, for the deployment of Dockerized applications on Amazon Web Services (AWS) EC2 instances. This setup utilizes the declarative pipeline approach, ensuring clarity and maintainability in your deployment process.

## Step-by-Step Guide

### Step 1: Create an EC2 Instance
1. Log in to the AWS Management Console.
2. Navigate to the EC2 Dashboard.
3. Launch a new instance named "jenkins-server" with the following specifications:
   - AMI: Linux
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

### Step 10: Create First Admin User
1. After the plugin installation is complete, Jenkins will prompt to create the first admin user.
2. Follow the on-screen instructions to add the necessary details for the admin user.

### Step 11: Fill Up Description
1. Once the admin user is created, Jenkins homepage will be displayed.
2. Proceed to fill up the necessary description or details for your Jenkins setup.

### Step 12: Create a CI/CD Pipeline
1. To create a new CI/CD pipeline, navigate to the Jenkins Dashboard.
2. Click on "New Item".

### Step 13: Add Project Details
1. Enter the name of the project as "todo-app".
2. Select the project type as "Freestyle project".
3. Click "Ok" to proceed.

### Step 14: Add Description
1. Fill up the description for the project as required.

### Step 15: Configure Source Code Management
1. Under the project configuration, select "Git" as the source code management system.
2. Add the repository URL and credentials if required.

### Step 16: Save Configuration
1. Save the project configuration by clicking on the "Save" or "Apply" button.

### Step 17: Verify Credential Addition
1. Verify that the repository URL and credentials are correctly added for accessing the source code.
2. If credentials are not added, ensure to add them to enable Jenkins to fetch code from the Git repository.

### Step 18: Add Build Step
1. Under the project configuration, select "Execute Shell" as the build step.
2. Write the necessary shell commands to build a Docker image and create a container from the Docker image.

### Step 19: Trigger Build
1. Click on "Build Now" to trigger the build process.
2. Monitor the build progress in the build history.

### Step 20: Check Output Console
1. Review the output console to monitor the build process and identify any errors or issues.

### Step 21: Access Live Web App
1. After a successful build, open a web browser.
2. Enter the following URL, replacing `<public_ip_of_ec2>` with the public IP address of your EC2 instance: `http://<public_ip_of_ec2>:8001`.
3. This will allow you to access the live web application deployed using the CI/CD pipeline.

### Step 22: Test Pipeline
1. Make changes to the code in the GitHub repository and push them.
2. The pipeline should automatically trigger, and the new code will be deployed to the live web application.

### Step 23: Verify Deployment
1. After the pipeline runs successfully, verify that the changes are reflected in the live web application.
