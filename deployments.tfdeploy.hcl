# This file is now consistent with the minimal viable stack test.
# It uses literal values for inputs, which is the correct syntax.

identity_token "aws" {
  # This audience aligns with the standard for HCP Terraform Workload Identity
  audience = ["aws.workload.identity"]
}

identity_token "k8s" {
  audience = ["k8s.workload.identity"]
}

deployment "development" {
  #deployment_group = deployment_group.dev_group

  inputs = {
    aws_identity_token      = identity_token.aws.jwt
    role_arn                = "arn:aws:iam::177099687113:role/tfstacks-role"
    regions                 = ["us-east-1"]
    vpc_name                = "aeyuthira-dev"
    vpc_cidr                = "10.0.0.0/16"
    kubernetes_version      = "1.30"
    cluster_name            = "vearadyn-dev"
    tfc_kubernetes_audience = "k8s.workload.identity"
    tfc_hostname            = "https://app.terraform.io"
    tfc_organization_name   = "Elyndara"
    eks_clusteradmin_arn    = "arn:aws:iam::177099687113:role/aws_jacob.plicque_test-developer"
    eks_clusteradmin_username = "aws_jacob.plicque_test-developer"
    k8s_identity_token      = identity_token.k8s.jwt
    namespace               = "hashibank"
  }
}

/*deployment "prod" {
  inputs = {
    aws_identity_token        = identity_token.aws.jwt
    role_arn                  = "arn:aws:iam::177099687113:role/tfstacks-role"
    regions                   = ["us-east-1"]
    vpc_name                  = "vearadyn-prod"
    vpc_cidr                  = "10.20.0.0/16"
    kubernetes_version        = "1.30"
    cluster_name              = "vearadyn-eksprod02"
    tfc_kubernetes_audience   = "k8s.workload.identity"
    tfc_hostname              = "https://app.terraform.io"
    tfc_organization_name     = "vearadyn"
    eks_clusteradmin_arn      = "arn:aws:iam::855831148133:role/aws_jacob.plicque_test-developer"
    eks_clusteradmin_username = "aws_jacob.plicque_test-developer"
    k8s_identity_token        = identity_token.k8s.jwt
    namespace                 = "hashibank"
  }
  deployment_group = deployment_group.prod_group
}*/



