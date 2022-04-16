# Infrastructure for a myapp

### Infrastructure contains: 

## Terraform manifests for infrastructure deployment in the aws cloud


I made this choice based on the versatility of terraform. I did not use CloudFormation, because in conjunction with other tools, such as vault, ansible, it is less suitable.


   -  manifests include:
``` ./prod ```

  - ec2 instance for a jenkins ci/cd
  - eks cluster for a containerized application
  - ecr repo for storing images
  - vpc, sec, gw for network


## Ansible role for setup jenkins node:

I chose ansible because it is a universal tool for infrastructure orchestration.

   - role include:
``` ./roles/jenkins_common ```
  
   - Configure sudoers, Change root password, Install jenkins, Install kubectl, Install helm, change sshd config.
       
Author: Sergey Zamashnoy
