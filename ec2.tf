resource "aws_instance" "testingJenkinsWithVamsi" {
    ami = var.ami_id
    instance_type = var.instance_type
    monitoring = true

# this was added to fix checkov. When practicing or teaching, do not add first but add after checkov is failed to show use of checkov
    root_block_device {
        encrypted = true
      
    }
    
    tags = {
        Name = "airbnb-infra"
    }
  
}


