provider "aws" {
    region = "eu-central-1"
}

#create RDS mysql_db

resource "aws_db_instance" "rds" {
  identifier           = "rds-new"
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = var.RDS_USERNAME
  password             = var.RDS_PASSWORD
  skip_final_snapshot  = true
  port                 = "3306"
  
  provisioner "local-exec" {
    command = "export RDS_HOSTNAME=${self.address}"
  }
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

  provisioner "local-exec"{
    command = "export REDIS_HOSTNAME=${self.cache_nodes.0.address}"
  }

}
