# Production Database Setup Guide

**Date**: 2025-12-01
**Purpose**: Manual migration and seed execution for production/staging deployments via Dokploy

---

## Table of Contents

1. [Overview](#1-overview)
2. [Prerequisites](#2-prerequisites)
3. [Quick Reference](#3-quick-reference)
4. [Step-by-Step Guide](#4-step-by-step-guide)
5. [Verification Steps](#5-verification-steps)
6. [Troubleshooting](#6-troubleshooting)
7. [Rollback Procedures](#7-rollback-procedures)

---

## 1. Overview

After each deployment, you must manually run database migrations and seeds. This guide provides step-by-step instructions for:

- Running database migrations to create/update tables
- Running seeds to populate initial data (admin user, test data)
- Verifying the database state

### Why Manual Execution?

1. **Safety**: Review changes before applying to production
2. **Control**: Test on staging before production
3. **Visibility**: See exactly what changes are made
4. **Rollback**: Easier to identify and revert issues

---

## 2. Prerequisites

### SSH Access

Ensure you have SSH access configured:

```bash
# Test SSH connection
ssh root@unolab251201
```

### Required Information

| Item | Value |
|------|-------|
| SSH Host | `unolab251201` (or `158.247.197.14`) |
| SSH User | `root` |
| Container Name Pattern | `mce-phoenix-*` |

---

## 3. Quick Reference

### Commands at a Glance

```bash
# SSH into server
ssh root@unolab251201

# Find the running container
docker ps | grep mce-phoenix

# Run migrations
docker exec -it <CONTAINER_NAME> /app/bin/mce eval "Mce.Release.migrate"

# Run seeds
docker exec -it <CONTAINER_NAME> /app/bin/mce eval "Mce.Release.seed"

# Run both (initial setup)
docker exec -it <CONTAINER_NAME> /app/bin/mce eval "Mce.Release.setup"
```

---

## 4. Step-by-Step Guide

### Step 1: SSH into the Server

```bash
ssh root@unolab251201
```

Expected output:
```
Welcome to Ubuntu 24.04 LTS
...
root@uno-lab-251201:~#
```

### Step 2: Find the Running Container

```bash
docker ps | grep mce-phoenix
```

Expected output:
```
abc123def456   mce-phoenix-imw1lu:latest   "/app/bin/server"   5 minutes ago   Up 5 minutes (healthy)   4000/tcp   mce-phoenix-imw1lu.1.xyz789...
```

Copy the **CONTAINER ID** (first column, e.g., `abc123def456`) or **NAMES** (last column).

### Step 3: Run Database Migrations

```bash
docker exec -it <CONTAINER_ID> /app/bin/mce eval "Mce.Release.migrate"
```

Replace `<CONTAINER_ID>` with your actual container ID.

**Example:**
```bash
docker exec -it abc123def456 /app/bin/mce eval "Mce.Release.migrate"
```

Expected output:
```
[info] == Running 20241101000001 Mce.Repo.Migrations.CreateUsers.change/0 forward
[info] create table users
[info] create index users_email_index
[info] == Migrated 20241101000001 in 0.1s
...
```

### Step 4: Run Database Seeds

```bash
docker exec -it <CONTAINER_ID> /app/bin/mce eval "Mce.Release.seed"
```

Expected output:
```
Checking admin user...
Admin user already exists: admin@anysite.kr
Checking test user...
Test user already exists: jason@anysite.kr
...
```

### Step 5: Exit the Server

```bash
exit
```

---

## 5. Verification Steps

### Verify Tables Exist

You can verify the database setup by connecting to PostgreSQL:

```bash
# Find PostgreSQL container
docker ps | grep mce-postgresql

# Connect to PostgreSQL
docker exec -it <POSTGRES_CONTAINER> psql -U postgres -d mce_prod
```

Then run:
```sql
-- List all tables
\dt

-- Check users table
SELECT id, email, nickname, is_admin FROM users;

-- Exit
\q
```

### Verify Application Works

1. Open browser: `https://mce.anysite.kr`
2. Navigate to login page: `https://mce.anysite.kr/users/log-in`
3. Try logging in with test credentials:
   - **Admin**: `admin@anysite.kr` / `AdminPassword123!`
   - **Test User**: `jason@anysite.kr` / `jason12345678`

---

## 6. Troubleshooting

### Error: "relation does not exist"

**Cause**: Migrations haven't been run.

**Solution**: Run migrations first:
```bash
docker exec -it <CONTAINER_ID> /app/bin/mce eval "Mce.Release.migrate"
```

### Error: "connection refused" or "could not connect"

**Cause**: Database connection issue.

**Check**:
1. Verify PostgreSQL container is running:
   ```bash
   docker ps | grep postgresql
   ```
2. Verify environment variables in Dokploy:
   - `DATABASE_URL` is correctly set
   - Format: `postgresql://user:password@host:5432/database`

### Error: "duplicate key value"

**Cause**: Seeds already ran or data exists.

**Solution**: This is usually safe to ignore. Seeds are designed to be idempotent (won't create duplicates).

### Container Not Found

**Cause**: Container might be restarting due to health check failures.

**Solution**:
1. Check service status:
   ```bash
   docker service ls
   ```
2. Check service logs:
   ```bash
   docker service logs mce-phoenix-imw1lu --tail 50
   ```

---

## 7. Rollback Procedures

### Rollback to a Specific Migration

If you need to undo a migration:

```bash
docker exec -it <CONTAINER_ID> /app/bin/mce eval "Mce.Release.rollback(Mce.Repo, 20241201000000)"
```

Replace `20241201000000` with the migration version you want to roll back to.

### Find Migration Versions

To see available migrations:

```bash
# List migration files in the project
ls -la priv/repo/migrations/
```

Or check the schema_migrations table:

```bash
docker exec -it <POSTGRES_CONTAINER> psql -U postgres -d mce_prod -c "SELECT * FROM schema_migrations ORDER BY inserted_at DESC;"
```

---

## Complete Example Session

```bash
# 1. SSH into server
ssh root@unolab251201

# 2. Find container
docker ps | grep mce-phoenix
# Output: abc123def456   mce-phoenix-imw1lu:latest ...

# 3. Run migrations
docker exec -it abc123def456 /app/bin/mce eval "Mce.Release.migrate"
# Output: [info] == Running migrations...

# 4. Run seeds
docker exec -it abc123def456 /app/bin/mce eval "Mce.Release.seed"
# Output: Admin user created...

# 5. Verify
curl -s https://mce.anysite.kr/health
# Output: {"status":"ok"}

# 6. Exit
exit
```

---

## Notes

- **Always run migrations before seeds**
- **Seeds are idempotent** - safe to run multiple times
- **Backup first** - Consider backing up the database before running migrations on production
- **Test on staging** - Since this server serves as both staging and production, test thoroughly before going live

---

**Document Version**: 1.0
**Last Updated**: 2025-12-01
