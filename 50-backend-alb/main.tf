resource "aws_lb" "backend_alb" {
  name = "${local.common_name_suffix}-backend-alb" # roboshop-dev-backend-alb
  internal = true 
  load_balancer_type = "application"
  security_groups = [local.backend_alb_sg_id]
  subnets = local.private_subnet_ids
  enable_deletion_protection = false
  tags = merge(
    local.common_tags,
    {
      Name = "${var.project_name}-${var.environment}-backend-alb"
    }
  )
}

## listiner rule , Backend alb listiening on rule port no 80
resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response { ### if target group  is not created
    content_type = "text/plain"
    message_body = "Welcome to Application Load Balancer"
    status_code  = "200"
      }
  }
}

### create r53 for backend lb

resource "aws_route53_record" "backend_alb" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.environment}.${var.domain_name}" # catalogue.backend-alb-dev.daws88s.fun
  type    = "A"
  ## these are our alb details , not our domain details
  alias {
    name  = aws_lb.backend_alb.dns_name
    zone_id = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
}





