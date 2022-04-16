# Infrastructure for a myapp

## Infrastructure contains: 

### Terraform manifests for infrastructure deployment in the aws cloud


I made this choice based on the versatility of terraform. I did not use CloudFormation, because in conjunction with other tools, such as vault, ansible, it is less suitable.


   Manifests include:

```
 ./prod
```

     - EC2 instance for a jenkins CI/CD.
     - EKS cluster for a containerized application.
     - ECR repo for storing images.
     - VPC, SEC, GW for a network.

---

### Ansible role for setup jenkins node:

I chose ansible because it is a universal tool for infrastructure orchestration.

   Role include:

```
  ./roles/jenkins_common
```
     - Configure sudoers 
     - Change root password
     - Change sshd config 
     - Install Jenkins
     - Install kubectl 
     - Install Helm 
       

Author: Sergey Zamashnoi
