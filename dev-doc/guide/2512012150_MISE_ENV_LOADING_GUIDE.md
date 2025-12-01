# Loading Environment Variables with mise

This guide explains how to load environment variables from `.env` files using mise for local development.

## Prerequisites

- mise installed (`brew install mise`)
- mise activated in your shell

## Setup

### 1. Create mise.toml in project root

```toml
[env]
_.file = '.env'
```

Or with sensitive value redaction:

```toml
[env]
_.file = { path = '.env', redact = true }
```

### 2. Trust the configuration

```bash
mise trust
```

### 3. Verify environment variables are loaded

```bash
echo $USE_RESEND
# Should output: true
```

## .env File Format

Create a `.env` file in the project root:

```bash
# API Keys
RESEND_API_KEY=re_xxxxxxxxx

# Feature Flags
USE_RESEND=true
```

**Note:** Do not commit `.env` to version control. It should be listed in `.gitignore`.

## Usage

Once configured, mise automatically loads environment variables when you enter the project directory.

```bash
cd /path/to/mce
mix phx.server  # env vars are automatically available
```

## Advanced Configuration

### Multiple .env files

```toml
[env]
_.file = ['.env', '.env.local']
```

### Environment-specific files

```toml
[env]
_.file = '.env.{{env.MIX_ENV}}'
```

### Load after tools are defined

```toml
[env]
_.file = { path = '.env', tools = true }
```

## Troubleshooting

### Variables not loading

1. Ensure mise is activated in your shell
2. Run `mise trust` in the project directory
3. Check `mise.toml` syntax

### Verify loaded variables

```bash
mise env
```

## Reference

- [mise Environments Documentation](https://mise.jdx.dev/environments/)
- [mise Configuration](https://mise.jdx.dev/configuration.html)
