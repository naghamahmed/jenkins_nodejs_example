provider "aws" {
    region = "eu-central-1"
}

#create RDS mysql_db

resource "aws_db_instance" "rds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
}

#create Elasticashe redis_db

resource "aws_elasticache_cluster" "elasticashe" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
}