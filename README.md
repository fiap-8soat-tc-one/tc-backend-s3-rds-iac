
# Configuração Terraform para Recursos AWS

Este repositório contém arquivos Terraform para provisionar e gerenciar recursos na AWS. Abaixo está uma explicação de cada arquivo:

## 1. `main.tf`
O arquivo `main.tf` é o ponto de entrada para a configuração do Terraform. Ele configura a configuração geral, inicializa o provedor e integra todos os módulos de recursos.

### Principais Funcionalidades:
- Define o provedor AWS e sua configuração (ex.: região).
- Chama módulos individuais de recursos (como RDS e grupos de segurança).

**Trecho de Código:**
```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.1"
    }
  }

  backend "s3" {
    bucket = "bucket-tf-state-fiap-team-32"
    key    = "rds/terraf...
```

---

## 2. `rds-db-instance.tf`
Este arquivo é responsável por provisionar uma **instância de banco de dados Amazon RDS**.

### Principais Funcionalidades:
- Configura o tipo de instância de banco de dados (ex.: `db.t3.micro`).
- Especifica o armazenamento, tipo de engine (ex.: MySQL ou PostgreSQL) e versão.
- Integra-se com o grupo de segurança definido em `sg-database.tf` para controle de acesso.

**Trecho de Código:**
```hcl
resource "aws_db_instance" "db-tc-backends3" {
  identifier          = "db-tc-backends3"
  engine              = "postgres"
  engine_version      = "16.3"
  instance_class      = var.instance_type
  a...
```

---

## 3. `sg-database.tf`
Este arquivo cria um **grupo de segurança** para controlar o acesso à instância RDS.

### Principais Funcionalidades:
- Define regras de entrada e saída para restringir ou permitir tráfego específico.
- Garante que apenas fontes confiáveis possam acessar o banco de dados.

**Trecho de Código:**
```hcl
resource "aws_security_group" "security-group-database" {
  name        = "security-group-database"
  description = "Security Group Database"

  ingress {
    from_port   = 5432
    to_port     = 5432...
```

---

## 4. `vars.tf`
Este arquivo centraliza as **variáveis** usadas na configuração do Terraform.

### Principais Funcionalidades:
- Define variáveis para configurações reutilizáveis, como tipo de instância de banco de dados, armazenamento alocado e região.
- Ajuda a gerenciar configurações específicas do ambiente (ex.: dev, staging, produção).

**Trecho de Código:**
```hcl
variable "db_username" {
  description = "DB Username"
  type        = string
  default     = "postgres"
}

variable "db_password" {
  description = "DB Password"
  type        = string
  sensitive   ...
```

---

## Como Usar
1. Certifique-se de ter o Terraform instalado no seu sistema local.
2. Configure suas credenciais AWS usando o AWS CLI ou variáveis de ambiente.
3. Inicialize o diretório de trabalho do Terraform:
   ```bash
   terraform init
   ```
4. Valide os arquivos de configuração:
   ```bash
   terraform validate
   ```
5. Aplique a configuração para provisionar os recursos:
   ```bash
   terraform apply
   ```
6. Destrua os recursos quando eles não forem mais necessários:
   ```bash
   terraform destroy
   ```

## Notas
- Certifique-se de atualizar as variáveis em `vars.tf` com os detalhes específicos do seu ambiente.
- Garanta que as permissões apropriadas do IAM estejam disponíveis para executar os comandos do Terraform.

---
Em caso de dúvidas ou problemas, fique à vontade para entrar em contato.
