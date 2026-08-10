output "iam_instance_profile" {
  value = aws_iam_instance_profile.this_ec2_ssm_profile.name
}
