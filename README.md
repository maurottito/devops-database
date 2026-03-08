# devops-database

PostgreSQL database for the e-commerce platform. Defines the schema and seeds sample data for `products` and `orders`.

## Requirements

- PostgreSQL 15+

## Setup

```bash
git clone <repo-url>
cd devops-database

# Create the database and load schema + seed data
psql -U postgres -c "CREATE DATABASE ecommerce;"
psql -U postgres -d ecommerce -f init.sql
```

## Environment Variables

| Variable            | Default     |
|---------------------|-------------|
| `POSTGRES_DB`       | `ecommerce` |
| `POSTGRES_USER`     | `postgres`  |
| `POSTGRES_PASSWORD` | `password`  |
| `POSTGRES_PORT`     | `5432`      |

## Schema

- **products** — name, price, description
- **orders** — product_id, quantity, total_price, status

`init.sql` seeds 5 sample products on first run.
