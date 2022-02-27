resource "aws_lb" "frontend" {
  name                       = "frontend-${var.ENV}"
  internal                   = false
  load_balancer_type         = "application"
  enable_deletion_protection = false
  subnets                    = data.terraform_remote_state.vpc.outputs.SUBNETS_ID
  tags = {
    Name = "frontend-${var.ENV}"
    env  = var.ENV
  }
}