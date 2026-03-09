FROM postgres:15-alpine

# Upgrade OS packages to patch known CVEs
RUN apk upgrade --no-cache

# Environment defaults are overridden by docker-compose / runtime env vars
ENV POSTGRES_DB=ecommerce \
    POSTGRES_USER=postgres \
    POSTGRES_PASSWORD=changeme

# Copy initialization SQL – PostgreSQL runs all *.sql files in /docker-entrypoint-initdb.d
# automatically on first startup.
COPY init.sql /docker-entrypoint-initdb.d/01-init.sql

EXPOSE 5432

# Healthcheck using pg_isready (bundled with postgres image)
HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=5 \
  CMD pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB" || exit 1
