# Provider for destination bucket
provider "aws" {
  alias  = "destination"
  region = var.destination_region
}

# Provider for source bucket
provider "aws" {
  alias  = "source"
  region = var.source_region
}
