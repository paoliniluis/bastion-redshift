resource "aws_redshift_cluster" "redshift" {
  cluster_identifier = "tf-redshift-cluster"
  database_name      = "sample"
  master_username    = "metabase"
  master_password    = "Metasample123"
  node_type          = "dc2.large"
  cluster_type       = "single-node"
  skip_final_snapshot = true
  # iam_roles = [aws_iam_role.redshift.arn]
  vpc_security_group_ids = [aws_security_group.redshift_sg.id]
  cluster_subnet_group_name = aws_redshift_subnet_group.redshift.name
  publicly_accessible = false
  enhanced_vpc_routing = true
  tags = {
    Name = "tf-redshift-cluster"
  }
}

output "redshift_dns" {
  value = aws_redshift_cluster.redshift.dns_name
}