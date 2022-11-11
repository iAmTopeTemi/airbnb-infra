resource "aws_instance" "testingJenkinsWithVamsi" {
    ami = var.ami_id
    instance_type = var.instance_type
    monitoring = true
    
    tags = {
        Name = "airbnb-infra"
    }
  
}


