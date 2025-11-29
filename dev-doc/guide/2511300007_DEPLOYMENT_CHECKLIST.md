# MCE Deployment Checklist

**Document ID**: 2511300007_DEPLOYMENT_CHECKLIST
**Created**: 30 November 2025, 00:07
**Status**: Active

---

## Pre-Deployment Requirements

### Environment Variables (Required)

| Variable | Description | Example |
|----------|-------------|---------|
| `DATABASE_URL` | PostgreSQL connection string | `ecto://user:pass@host:5432/mce_prod` |
| `SECRET_KEY_BASE` | 64-byte secret for cookie signing | Generate with `mix phx.gen.secret` |
| `PHX_HOST` | Production hostname | `mce.example.com` |
| `PHX_SERVER` | Enable HTTP server | `true` |
| `PORT` | HTTP port (default: 4000) | `4000` |

### Environment Variables (Optional)

| Variable | Description | Default |
|----------|-------------|---------|
| `POOL_SIZE` | Database connection pool size | `10` |
| `ECTO_IPV6` | Enable IPv6 for database | `false` |
| `GOOGLE_MAPS_API_KEY` | For US/BR address autocomplete | Mock data used if absent |

---

## Pre-Deployment Checklist

### 1. Code Quality

- [ ] All tests pass: `mix test`
- [ ] No compiler warnings: `mix compile --warning-as-errors`
- [ ] Code formatted: `mix format --check-formatted`
- [ ] Dependencies up to date: `mix deps.outdated`
- [ ] Run full precommit: `mix precommit`

### 2. Database

- [ ] Migrations reviewed: `mix ecto.migrations`
- [ ] Seeds reviewed (if applicable): `priv/repo/seeds.exs`
- [ ] Backup production database before migration
- [ ] Index performance validated (5 indexes added for query optimisation)

### 3. Assets

- [ ] Assets compile: `mix assets.build`
- [ ] Production assets ready: `mix assets.deploy`
- [ ] Static file digests generated: check `priv/static/cache_manifest.json`

### 4. Configuration

- [ ] `config/runtime.exs` reviewed for production settings
- [ ] Mailer configured (Swoosh adapter for production)
- [ ] Logging level appropriate (`config :logger, level: :info`)

---

## Deployment Steps

### Option A: Mix Release

```bash
# 1. Build release
MIX_ENV=prod mix release

# 2. Set environment variables
export DATABASE_URL="ecto://user:pass@host:5432/mce_prod"
export SECRET_KEY_BASE="your-64-byte-secret"
export PHX_HOST="mce.example.com"
export PHX_SERVER=true

# 3. Run migrations
_build/prod/rel/mce/bin/mce eval "Mce.Release.migrate"

# 4. Start server
_build/prod/rel/mce/bin/mce start
```

### Option B: Docker

```dockerfile
# Dockerfile example structure
FROM elixir:1.15-alpine AS build
# ... build steps ...

FROM alpine:3.18 AS app
# ... runtime steps ...
CMD ["/app/bin/server"]
```

### Option C: Fly.io

```bash
# Generate fly.toml
fly launch

# Deploy
fly deploy

# Run migrations
fly ssh console -C "/app/bin/migrate"
```

---

## Post-Deployment Checklist

### 1. Smoke Tests

- [ ] Home page loads (`/`)
- [ ] User can register (`/users/register`)
- [ ] User can log in (`/users/log-in`)
- [ ] Dashboard accessible (`/dashboard`)
- [ ] Farms CRUD works (`/farms`)
- [ ] Livestock wizard works (`/farms/:id/livestock/new`)
- [ ] Emission reports generate (`/farms/:id/emissions`)
- [ ] PDF export works (`/reports/farms/:id/emissions/:year/pdf`)
- [ ] Admin panel accessible to admins (`/admin/users`)

### 2. Performance

- [ ] Page load times acceptable (< 2s)
- [ ] Database queries optimised (indexes in place)
- [ ] Asset caching working (check HTTP headers)

### 3. Security

- [ ] HTTPS enforced
- [ ] HSTS headers enabled
- [ ] CORS configured correctly
- [ ] Admin panel properly restricted

### 4. Monitoring

- [ ] Error logging configured
- [ ] LiveDashboard accessible in dev (disabled in prod)
- [ ] Database connection pool monitored

---

## Database Migration Strategy

### Before Migration

1. Create full database backup
2. Review migration files for potential issues
3. Test migrations on staging environment
4. Plan rollback strategy

### Running Migrations

```bash
# Via release
_build/prod/rel/mce/bin/mce eval "Mce.Release.migrate"

# Via Mix (if available)
MIX_ENV=prod mix ecto.migrate
```

### Rollback (if needed)

```bash
# Via release
_build/prod/rel/mce/bin/mce eval "Mce.Release.rollback(Mce.Repo, 20251129232819)"

# Via Mix
MIX_ENV=prod mix ecto.rollback
```

---

## SSL/TLS Configuration

### Option 1: Reverse Proxy (Recommended)

Use nginx, Caddy, or cloud load balancer to handle SSL termination.

```nginx
server {
    listen 443 ssl http2;
    server_name mce.example.com;

    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;

    location / {
        proxy_pass http://localhost:4000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

### Option 2: Direct SSL (in config/runtime.exs)

```elixir
config :mce, MceWeb.Endpoint,
  https: [
    port: 443,
    cipher_suite: :strong,
    keyfile: System.get_env("SSL_KEY_PATH"),
    certfile: System.get_env("SSL_CERT_PATH")
  ]
```

---

## Backup Strategy

### Database Backups

```bash
# PostgreSQL backup
pg_dump -h host -U user mce_prod > backup_$(date +%Y%m%d).sql

# Automated daily backups (cron)
0 2 * * * pg_dump -h host -U user mce_prod | gzip > /backups/mce_$(date +\%Y\%m\%d).sql.gz
```

### File Uploads (if any)

- Backup `priv/static/uploads/` directory
- Consider S3 or similar for production file storage

---

## Troubleshooting

### Common Issues

| Issue | Solution |
|-------|----------|
| Database connection refused | Check DATABASE_URL and network access |
| Assets not loading | Run `mix assets.deploy` and check digest |
| WebSocket errors | Ensure proxy passes Upgrade headers |
| Session issues | Verify SECRET_KEY_BASE is consistent |

### Useful Commands

```bash
# Check release health
_build/prod/rel/mce/bin/mce remote

# View logs
_build/prod/rel/mce/bin/mce daemon_iex

# Run IEx console
_build/prod/rel/mce/bin/mce start_iex
```

---

## Version Information

- **Elixir**: 1.15+
- **Erlang/OTP**: 26+
- **Phoenix**: 1.8
- **PostgreSQL**: 15+
- **Node.js**: 18+ (for asset compilation)

---

## Contact & Support

For deployment issues, check:
- Phoenix deployment guides: https://hexdocs.pm/phoenix/deployment.html
- Elixir releases: https://hexdocs.pm/mix/Mix.Tasks.Release.html
