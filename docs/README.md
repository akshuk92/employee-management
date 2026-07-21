# Employee Management System

A Spring Boot based Employee Management System used internally for HR operations.
This project doubles as a **Linux / DevOps practice sandbox** — the directory
structure mimics a real-world enterprise Java application deployment.

## Project Structure

- `src/` — Java source code (controllers, services, repositories, models)
- `config/` — Environment configuration files (`.properties`, `.yml`)
- `logs/` — Application, error, and access logs
- `scripts/` — Shell scripts for build, deploy, backup, cleanup, monitoring
- `backup/` — Backup archives and database dumps
- `docs/` — Project documentation
- `resources/` — Static resources and templates
- `temp/` — Temporary/scratch files (safe to delete)
- `uploads/` — User-uploaded files (resumes, documents)
- `downloads/` — Generated reports available for download
- `certificates/` — SSL/TLS certificates
- `secrets/` — Sensitive credentials (should be 600 permissions)

## Getting Started

```bash
./scripts/build.sh
./scripts/deploy.sh
```

## Tech Stack

- Java 17
- Spring Boot 3.2.0
- MySQL 8.0
- Maven
- Docker / Docker Compose
- Jenkins CI/CD

## Maintainers

DevOps Team — infra@company.com
