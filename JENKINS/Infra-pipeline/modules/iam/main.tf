data "aws_iam_policy_document" "this_ecs_task_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}


resource "aws_iam_role" "this_ecs_task_execution_role" {
  name               = var.ECS_TASK_EXECUTION_ROLE_NAME
  assume_role_policy = data.aws_iam_policy_document.this_ecs_task_assume_role.json

  tags = merge(var.COMMON_TAGS, {
    Name = var.ECS_TASK_EXECUTION_ROLE_NAME
  })
}


resource "aws_iam_role_policy_attachment" "this_ecs_task_execution_policy" {
  role       = aws_iam_role.this_ecs_task_execution_role.name
  policy_arn = var.ECS_TASK_EXECUTION_POLICY_ARN
}