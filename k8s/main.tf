terraform {
  backend "s3" {
    bucket = "dinhlehoangdemo-terraform-state-k8s"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}
provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "minikube"
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "my-first-namespace"
  }
}