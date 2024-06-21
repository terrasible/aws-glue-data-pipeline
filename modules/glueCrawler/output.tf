output "roleArn" {
  value = aws_iam_role.role.arn
}

output "crawler_name" {
  value = aws_glue_crawler.crawler_sources.*.id
}
