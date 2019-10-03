# terraform-test

## How to use?

* Download terraform cli and put it in the same folder
* Create your own secret.tfvars like:

```yaml
provider_username = "user_name"
provider_password = "your password"
default_keypair   = "have one?"
```

* terraform init
* terraform apply -var-file="secret.tfvars"
