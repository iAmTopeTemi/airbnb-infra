resource "aws_instance" "testingJenkinsWithVamsi" {
    ami = var.ami_id
    instance_type = var.instance_type
    
    tags = {
        Name = "airbnb-infra"
    }
  
}