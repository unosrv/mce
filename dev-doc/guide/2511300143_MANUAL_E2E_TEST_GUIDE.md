# Manual E2E Test Guide

**Document ID**: 2511300143_MANUAL_E2E_TEST_GUIDE
**Created**: 30 November 2025, 01:43
**Purpose**: Guide for manual end-to-end testing of the MCE application

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Test Account Setup](#test-account-setup)
3. [User Flow Testing](#user-flow-testing)
4. [Admin Flow Testing](#admin-flow-testing)
5. [Checklist](#checklist)

---

## Prerequisites

### Development Server
```bash
# Start the Phoenix server
mix phx.server

# Access the application
open http://localhost:4000
```

### Database
Ensure you have a clean development database:
```bash
mix ecto.reset  # Warning: This will reset all data
```

---

## Test Account Setup

### Option 1: Create New User Account
1. Navigate to http://localhost:4000
2. Click "Register"
3. Fill in:
   - Email: `test@example.com`
   - Password: `TestPassword123!` (minimum 12 characters)
4. Check your email (development mailbox at http://localhost:4000/dev/mailbox)
5. Click the magic link to log in

### Option 2: Reset Existing Admin Password
Since passwords are stored as hashed values (bcrypt), you cannot recover them. To reset:

```bash
# Open IEx console
iex -S mix

# Reset admin password
alias Mce.Accounts
user = Accounts.get_user_by_email("admin@mce.local")
Accounts.reset_user_password(user, %{password: "NewAdminPass123!"})
```

### Option 3: Create Admin User via Seeds (Recommended)
```bash
# Run seeds to create default admin user
mix run priv/repo/seeds.exs

# Default admin credentials:
# Email: admin@anysite.com
# Password: AdminPassword123!
```

### Option 4: Create Admin via IEx Console
```elixir
# Open IEx console
iex -S mix

# Create new admin user
alias Mce.{Accounts, Repo}
{:ok, user} = Accounts.register_user(%{
  email: "newadmin@mce.local",
  password: "AdminPassword123!",
  nickname: "Admin"
})

# Make user an admin and confirm account
user
|> Ecto.Changeset.change(%{is_admin: true, confirmed_at: DateTime.utc_now(:second)})
|> Repo.update!()
```

---

## User Flow Testing

### Flow 1: Complete User Registration and Farm Setup

#### Step 1: User Registration
1. Navigate to http://localhost:4000
2. Click "Get Started" or "Register"
3. Enter email and password
4. Check development mailbox at http://localhost:4000/dev/mailbox
5. Click the login link in the email
6. **Verify**: User is logged in and redirected to dashboard

#### Step 2: Create First Farm
1. From Dashboard, click "My Farms" in the sidebar or navigate to http://localhost:4000/farms
2. Click "Add Farm" or "New Farm"
3. Fill in farm details:
   - **Name**: "Test Farm Korea"
   - **Country**: Korea (KR)
   - **Address**: Search for "서울특별시 강남구 테헤란로" (or any Korean address)
   - **Fiscal Year**: January 1
4. Click "Save"
5. **Verify**: Farm is created and appears in the farms list
6. **Verify**: Map preview shows the farm location

#### Step 3: Add Livestock Group
1. Navigate to the farm detail page
2. Click "Add Livestock Group"
3. **Step 1 - Basic Info**:
   - Name: "Dairy Herd 1"
   - Species: Dairy Cattle
   - Head Count: 100
   - Average Weight: 600 kg
4. **Step 2 - Production**:
   - Milk Yield: 25 L/day
   - Milk Fat Content: 4%
   - Lactation Days: 305
5. **Step 3 - Feed Composition**:
   - Concentrate Ratio: 40%
   - DMI: 20 kg/day
   - GE: 18.45 MJ/kg
6. **Step 4 - Manure**:
   - Manure System: Liquid/Slurry
   - Volatile Solids: 5.2 kg/day
7. **Step 5 - Review & Save**:
   - Review all data
   - Click "Complete" to save
8. **Verify**: Livestock group shows "Complete" status (no draft badge)

#### Step 4: Calculate Emissions
1. From the farm detail page, click "Calculate Emissions" or navigate to Emissions page
2. Select the fiscal year (current year)
3. Click "Calculate"
4. **Verify**: Emissions report is generated with:
   - Total emissions (t CO2e)
   - Enteric fermentation emissions
   - Manure CH4 emissions
   - Manure N2O emissions

#### Step 5: Download PDF Report
1. From the emissions report page, click "Download PDF"
2. **Verify**: PDF downloads with:
   - Farm information
   - Livestock summary
   - Emissions breakdown
   - Calculation methodology notes

### Flow 2: Save Draft Functionality

#### Step 1: Start New Livestock Group
1. Navigate to a farm
2. Click "Add Livestock Group"
3. Fill in Step 1 data only
4. Click "Save Draft" button

#### Step 2: Verify Draft Status
1. Navigate back to farm detail page
2. **Verify**: Livestock group shows "Draft" badge (yellow/warning color)
3. **Verify**: Action button says "Continue" (not "Edit Details")

#### Step 3: Resume Draft
1. Click "Continue" on the draft livestock group
2. **Verify**: Wizard resumes at the last saved step
3. Complete remaining steps
4. Click "Complete"
5. **Verify**: Draft badge is removed, shows as complete

### Flow 3: Multi-Country Testing

#### Korean Farm (KR)
1. Create farm with country: Korea
2. Test address search with Korean addresses:
   - "서울특별시 강남구 테헤란로 152" (Gangnam Finance Center)
   - "경기도 성남시 분당구 판교역로 235" (H Square)
3. **Verify**: Map preview shows correct location

#### US Farm
1. Create farm with country: United States
2. Enter address manually (Google Maps integration placeholder)
3. **Verify**: Form accepts US address format

#### Brazil Farm
1. Create farm with country: Brazil
2. Enter address manually
3. **Verify**: Form accepts Brazilian address format

---

## Admin Flow Testing

### Accessing Admin Panel

**URL**: http://localhost:4000/admin

**Requirements**: User must have `is_admin: true` in database

### Admin Flow 1: User Management

1. Log in as admin
2. Navigate to Admin Panel (http://localhost:4000/admin)
3. Click "Users" in the sidebar
4. **Verify**: Can view list of all users
5. **Verify**: Can view user details
6. **Verify**: Can edit user information

### Admin Flow 2: Farm Management

1. Navigate to Admin > Farms
2. **Verify**: Can view all farms (not just own farms)
3. **Verify**: Can edit any farm
4. **Verify**: Can view livestock groups for any farm

### Admin Flow 3: Reference Data Management

#### IPCC Emission Factors
1. Navigate to Admin > IPCC Factors
2. **Verify**: Can view existing factors by country/species
3. **Verify**: Can add new factors
4. **Verify**: Can edit existing factors

#### Feed Presets
1. Navigate to Admin > Feed Presets
2. **Verify**: Can view feed presets
3. **Verify**: Can add new presets with:
   - Name
   - Species
   - Concentrate ratio
   - Default values

### Admin Flow 4: Livestock Groups Overview

1. Navigate to Admin > Livestock Groups
2. **Verify**: Can view all livestock groups across all farms
3. **Verify**: Can filter by status (draft/complete)
4. **Verify**: Can edit any livestock group

---

## Checklist

### Home Page
- [ ] Professional landing page displays (not Phoenix default)
- [ ] Navigation links work (Register, Log in)
- [ ] Theme toggle works (light/dark mode)
- [ ] Responsive design on mobile

### User Authentication
- [ ] User registration works
- [ ] Magic link email is sent
- [ ] User can log in via magic link
- [ ] Session persists after page refresh
- [ ] User can log out

### Farm Management
- [ ] Can create new farm
- [ ] Address search works for Korean addresses
- [ ] Map preview displays for addresses with coordinates
- [ ] Can edit existing farm
- [ ] Can delete farm

### Livestock Wizard
- [ ] All 5 steps render correctly
- [ ] Step navigation works (Next/Previous)
- [ ] Save draft functionality works
- [ ] Draft badge displays on farm page
- [ ] Can resume draft from saved step
- [ ] Can complete wizard
- [ ] Validation errors display properly

### Emissions Calculation
- [ ] Can trigger calculation
- [ ] Report displays with all components:
  - [ ] Total emissions
  - [ ] Enteric fermentation breakdown
  - [ ] Manure CH4 breakdown
  - [ ] Manure N2O breakdown
- [ ] Historical comparison works (if previous year data exists)

### PDF Reports
- [ ] Farm emissions report downloads
- [ ] Comparison report downloads (if multiple farms)
- [ ] PDF contains accurate data
- [ ] PDF formatting is professional

### Admin Panel
- [ ] Only accessible to admin users
- [ ] User management works
- [ ] Farm management works
- [ ] IPCC factor management works
- [ ] Feed preset management works

### Internationalization
- [ ] Language switcher works
- [ ] Korean translations display
- [ ] English translations display
- [ ] Date/number formats are localized

### Performance
- [ ] Pages load within 2 seconds
- [ ] No visible loading delays
- [ ] Emissions calculation completes promptly

---

## Test Data Recommendations

### Dairy Cattle (Korean Farm)
```
Species: dairy_cattle
Head Count: 100
Average Weight: 600 kg
Milk Yield: 25 L/day
Milk Fat: 4%
Lactation Days: 305
Concentrate Ratio: 40%
DMI: 20 kg/day
GE: 18.45 MJ/kg
Manure System: liquid_slurry
VS: 5.2 kg/day
```

### Beef Cattle (US Farm)
```
Species: beef_cattle
Head Count: 200
Average Weight: 550 kg
Weight Gain: 1.2 kg/day
Concentrate Ratio: 15%
DMI: 12 kg/day
GE: 18.0 MJ/kg
Manure System: pasture
VS: 4.8 kg/day
```

### Swine (Brazil Farm)
```
Species: swine
Head Count: 500
Average Weight: 90 kg
Concentrate Ratio: 85%
DMI: 3 kg/day
GE: 17.0 MJ/kg
Manure System: anaerobic_lagoon
VS: 0.6 kg/day
```

---

## Troubleshooting

### Cannot Access Admin Panel
1. Check user admin status in database:
```elixir
iex -S mix
user = Mce.Accounts.get_user_by_email("your@email.com")
user.is_admin  # Should be true
```

2. Update user to admin if needed:
```elixir
user
|> Ecto.Changeset.change(%{is_admin: true})
|> Mce.Repo.update!()
```

### Magic Link Not Received
- Check http://localhost:4000/dev/mailbox for development emails
- Verify email configuration in `config/dev.exs`

### Address Search Not Working
- Korean addresses: Verify Juso API credentials in config
- The geocoder uses mock data in development by default

### PDF Not Downloading
- Check browser console for JavaScript errors
- Verify PDF generation service is running
