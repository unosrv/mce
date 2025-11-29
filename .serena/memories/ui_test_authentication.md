# UI Test Authentication Guide

## Login Page Structure

The login page (`/users/log-in`) has TWO separate forms:

1. **Magic Link Form (top)**:
   - Single email input
   - "Log in with email" button
   - Only sends email with magic link - requires clicking link in email
   - User must already exist

2. **Password Form (bottom)**:
   - Email input + Password input
   - "Log in and stay logged in" / "Log in only this time" buttons
   - User must already exist with password set

## Form Field Names

Both forms use the same field name structure:
- Email: `user[email]` (appears twice - use `.nth(1)` for password form)
- Password: `user[password]`

## Playwright Login Example

```javascript
// Use the SECOND email input for password login
await page.locator('input[name="user[email]"]').nth(1).fill('test@example.com');
await page.locator('input[name="user[password]"]').fill('password123456');
await page.click('text=Log in and stay logged in');
```

## Creating Test Users

Users must exist in database before login. Create via Mix script:

```bash
mix run -e '
alias Mce.Accounts
{:ok, user} = Accounts.register_user(%{
  email: "test@example.com",
  password: "password123456",
  nickname: "testuser"  # REQUIRED
})
'
```

## Test User Credentials

- Email: `test@example.com`
- Password: `password123456`
- Nickname: `testuser`

## Registration Requirements

- `email` - Required, unique
- `password` - Required, minimum length
- `nickname` - Required (can't be blank)
