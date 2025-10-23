# Deploy de Static Site no S3 com Terraform

Este repositório contém um projeto Terraform que cria um **bucket S3** na AWS configurado como **site estático**. Ele inclui um sufixo aleatório no nome do bucket para garantir unicidade global, evitando erros de "BucketAlreadyExists".

## Estrutura do Projeto

```
terraform/
└── s3-bucket-static/
    ├── main.tf        # Definição do bucket S3 e recursos
    ├── variables.tf   # Declaração das variáveis utilizadas
    ├── terraform.tfvars # Valores das variáveis
```

---

## Para que serve este código

- Cria um **bucket S3** na AWS.
- Configura o bucket como **site estático** (`index.html` e `error.html`).
- Garante **nome único do bucket** usando um sufixo aleatório.
- Facilita deploy automatizado usando **GitHub Actions**.

---

## Como usar localmente

1. Configure suas **credenciais AWS** (ex.: usuário `aim`):

```bash
export AWS_ACCESS_KEY_ID="SUA_CHAVE_AWS"
export AWS_SECRET_ACCESS_KEY="SUA_CHAVE_SECRETA"
export AWS_DEFAULT_REGION="us-east-1"
```

2. Entre na pasta do Terraform:

```bash
cd terraform/s3-bucket-static
```

3. Inicialize o Terraform:

```bash
terraform init
```

4. Veja o plano de execução (opcional):

```bash
terraform plan
```

5. Execute o deploy:

```bash
terraform apply -auto-approve
```

6. O Terraform irá criar o bucket e exibirá o **nome final do bucket**:

```
bucket_name_final = "static-site-ailton-9f3b2a1d"
```

---

## Deploy via GitHub Actions

Se você adicionar este projeto a um **workflow do GitHub Actions**, é possível fazer deploy automático:

- Configure **Secrets** no repositório:
  - `AWS_ACCESS_KEY_ID` → chave do usuário `aim`
  - `AWS_SECRET_ACCESS_KEY` → chave secreta do usuário `aim`
  - `AWS_DEFAULT_REGION` → região da AWS (ex.: `us-east-1`)
  - `GITHUB_TOKEN` → já fornecido automaticamente pelo GitHub

- Ao rodar o workflow (automaticamente ou manual via **workflow_dispatch**), o GitHub Actions:
  1. Inicializa o Terraform.
  2. Aplica o plano (`terraform apply`).
  3. Cria o bucket S3 com sufixo aleatório.
  4. Pode comentar em uma issue específica informando que o deploy foi concluído.

> ⚠️ **Importante:** O workflow **não faz push de código para o repositório**, apenas executa a criação de recursos na AWS. O “push” que ele faz refere-se a alterações nos **recursos da AWS**, não ao GitHub.

---

## Observações

- O bucket S3 precisa ter **nome global único** na AWS, por isso usamos `random_id` para gerar sufixo.
- O Terraform mantém o estado do bucket localmente ou no backend configurado (ex.: S3), para controlar futuras alterações.
- Para alterar o nome base do bucket, edite o `terraform.tfvars`:

```hcl
bucket_name = "static-site-ailton"
region      = "us-east-1"
```

---

## Autor

Desenvolvido por **Ailton Marcelo**, usando Terraform e AWS S3 para deploy de sites estáticos.

