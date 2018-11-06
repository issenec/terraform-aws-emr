variable "region" {
  default     = "us-east-1"
  description = "Region to build the EMR cluster in. If changed, you MUST update emr_config_mangement_cidr_blocks"
}

variable "sns_source_addresses" {
  type = "list"
  default = [
    "207.171.167.101/32",
    "207.171.167.25/32",
    "207.171.167.26/32",
    "207.171.172.6/32",
    "54.239.98.0/24",
    "54.240.217.16/29",
    "54.240.217.8/29",
    "54.240.217.64/28",
    "54.240.217.80/29",
    "72.21.196.64/29",
    "72.21.198.64/29",
    "72.21.198.72/32",
    "72.21.217.0/24"
  ]
  description = "Note: These change from region-to-region. See README for details."
}

// @NOTE We default to c5.xlarge since they are the cheapest supported instance for EMR
//       Change to r5.2xlarge for actual use cases
variable "master_instance_type" {
  default     = "c5.xlarge"
  description = "The Size of the Master"
}

variable "core_instance_type" {
  default     = "c5.xlarge"
  description = "The Size of the Core Node"
}

variable "core_instance_count_min" {
  default     = 1
  description = "The initial number of instances to start"
}

variable "core_instance_count_max" {
  default     = 3
  description = "The maximum number of core nodes to scale up to"
}

variable "emr_release" {
  default     = "emr-5.18.0"
  description = "The EMR release, see: https://docs.aws.amazon.com/emr/latest/ReleaseGuide/emr-release-5x.html"
}

variable "core_volume_size" {
  default     = 150
  description = "The size (in GB) where HDFS will store it's data"
}

variable "root_volume_size" {
  default     = 50
  description = "The size (in GB) the root filesystem will be"
}

variable "zeppelin_port" {
  default     = 8893
  description = "The port that Zeppelin runs on"
}

variable "cluster_name" {
  description = "A name for the cluster.  Most AWS resources created will contain this name for easy identification"
}

variable "vpc_id" {
  description = "The VPC in which to create the EMR cluster, subnet IDs will be inferred. See Security Module in README"
}

variable "applications" {
  type        = "list"
  default     = ["Hadoop", "JupyterHub", "Ganglia", "Spark", "Zeppelin", "Livy"]
  description = "Applications to install on EMR"
}
