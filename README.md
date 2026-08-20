# 🚀 Terraform AWS Infrastructure

> A hands-on Infrastructure as Code project using Terraform to build AWS infrastructure step by step.

## 📌 About

This project focuses on learning how AWS infrastructure components work together and how to manage them using **Terraform**.

The infrastructure is being built incrementally, validated with Terraform, and tracked using Git and GitHub.

## 🏗️ Architecture

```text
                         🌍 INTERNET
                              │
                              ▼
                    ┌──────────────────┐
                    │ Internet Gateway │
                    └────────┬─────────┘
                             │
                             ▼
                    ┌──────────────────┐
                    │   Route Table    │
                    │   0.0.0.0/0 → IGW│
                    └────────┬─────────┘
                             │
                      Route Association
                             │
                             ▼
              ┌────────────────────────────┐
              │            VPC             │
              │         10.0.0.0/16        │
              │                            │
              │   ┌────────────────────┐   │
              │   │   Public Subnet    │   │
              │   │    10.0.1.0/24     │   │
              │   │                    │   │
              │   │       EC2          │   │
              │   │    🛡️ Security     │   │
              │   │       Group        │   │
              │   └────────────────────┘   │
              └────────────────────────────┘
```

## ☁️ AWS Resources

| Resource | Purpose |
|---|---|
| **VPC** | Main AWS network |
| **Public Subnet** | Subnet for Internet-facing resources |
| **Internet Gateway** | Provides Internet connectivity |
| **Route Table** | Controls network routing |
| **Route Association** | Connects the route table to the subnet |
| **Security Group** | Controls inbound and outbound traffic |
| **EC2** | Compute resource |

## 🌐 Network Configuration

**VPC**

```text
10.0.0.0/16
```

**Public Subnet**

```text
10.0.1.0/24
```

**Internet Route**

```text
0.0.0.0/0 → Internet Gateway
```

The public subnet uses the route table associated with the Internet Gateway to provide a path to the Internet.

## 🔐 Security Group

The Security Group acts as a virtual firewall for the EC2 instance.

- **Ingress** → Controls incoming traffic
- **Egress** → Controls outgoing traffic
- **SSH** → TCP `22`
- **HTTP** → TCP `80`

## 🛠️ Technologies

- ☁️ AWS
- 🏗️ Terraform
- 🔀 Git
- 🐙 GitHub
- 🐧 Linux / WSL

## 📂 Project Structure

```text
terraform-aws-infra/
│
├── main.tf
├── vpc.tf
├── outputs.tf
├── security-group.tf
├── README.md
└── ...
```

## 🚀 Terraform Workflow

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

To remove Terraform-managed infrastructure:

```bash
terraform destroy
```

## 📈 Progress

- [x] Terraform setup
- [x] AWS provider
- [x] EC2 configuration
- [x] Security Group
- [x] Ingress & Egress
- [x] VPC
- [x] Public Subnet
- [x] Internet Gateway
- [x] Route Table
- [x] Route Association
- [ ] Complete EC2 networking
- [ ] Infrastructure deployment

## ⚠️ Current Status

The infrastructure is currently being developed and validated using:

```bash
terraform fmt
terraform validate
terraform plan
```

`terraform apply` has **not been executed yet**.

The project will continue to evolve as additional AWS and Terraform concepts are introduced.

## 🎯 Goal

Build a strong practical foundation in:

**AWS → Networking → Terraform → Security → Git/GitHub → DevOps**

---

> **Learn it → Build it → Validate it → Version it → Deploy it**