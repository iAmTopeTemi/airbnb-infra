resource "aws_instance" "testingJenkinsWithVamsi" {
    ami = var.ami_id
    instance_type = var.instance_type
    monitoring = true


    root_block_device {
        encrypted = true
      
    }
    
    tags = {
        Name = "airbnb-infra"
    }
  
}


