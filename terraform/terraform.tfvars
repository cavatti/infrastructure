# Nome do bucket S3
bucket_name = "landing-page"

# Região da AWS
region = "us-east-1"

# Controle de versão do bucket (opcional)
versioning = true

# Tags do bucket (opcional, útil para organizar recursos)
tags = {
  Environment = "Dev"
  Project     = "StaticSite"
  Owner       = "Ailton"
}

# Configurações de logging do bucket (opcional)
logging = {
  target_bucket = ""
  target_prefix = "log/"
}

# Configurações de site estático (opcional)
website = {
  index_document = "index.html"
  error_document = "error.html"
}
