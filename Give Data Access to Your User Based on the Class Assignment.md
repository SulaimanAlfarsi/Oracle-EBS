# Give Data Access to Your User (Class Assignment)

**Student:** Sulaiman
**Module:** Oracle Fusion Cloud – Security & OTBI
**Source guides:** Day 27 (Create User / Assign Roles), Day 32 (Class Assignment – Data Access), Day 33 (Roles)

---

## 1. Objective

Show that in Oracle Fusion (RBAC – Role Based Access Control) a user needs **two things** to see data:

1. **Roles** (job / abstract / duty) → what the user can *do*.
2. **Data access** (e.g. Business Unit) → which *data* the user can see.

You will:

1. Create your user (Sulaiman) and assign roles.
2. Build an analysis → **No data** (user has no data access).
3. Give data access for Business Unit **US1 Business Unit**.
4. Run the analysis again → **data is displayed**.

### Role reminders

| BI Role | Can do |
|---------|--------|
| BI Author | Create, modify |
| BI Consumer | Only view |
| BI Administrator | Create, view, administer |

> When choosing roles, always select the Oracle-delivered roles whose code starts with **`ORA_`** (do not use the `FND_` or copied roles).

---

## 2. Login as admin

- Open the Fusion URL given by your instructor.
- Sign in with the **admin user** (has *IT Security Manager*) and its password.

---

## 3. Steps

### Part A – Create the user

1. **Navigator > Tools > Security Console**.
   (If prompted, click **Fusion Runtime** / **OK** to load the security data.)
2. Click **Users** (left side) → **Add User Account**.
3. Enter:
   - **First Name:** `Sulaiman`
   - **Last Name:** `Alfarsi` (or your last name)
   - **Username:** choose your username
   - **Password / Confirm Password:** choose a password (keep it private)
   - **User Category:** `DEFAULT`
4. Click **Save and Close**.

### Part B – Assign roles

1. In **Security Console > Users**, search your username → click the name → **Edit**.
2. Click **Add Role** and add each role below (search → select → **Add Role Membership**):
   - **IT Security Manager**
   - **Employee** (abstract role)
   - **Accounts Payable Manager**
3. (Day 33 extra roles, optional) also add **Human Resource Specialist / HCM** roles if your instructor asks.
4. Click **Done** → **Save and Close**.

### Part C – Synchronise users and roles

1. **Navigator > Tools > Scheduled Processes**.
2. Click **Schedule New Process**.
3. Search and select **Import User and Role Application Security Data** → **OK**.
4. Click **Submit** → note the Process ID → wait until the status is **Succeeded** (click **Refresh**).

### Part D – Test: analysis with NO data access

1. **Sign out**, then sign in with your user.
2. **Navigator > Tools > Reports and Analytics > Browse Catalog**.
3. **Create > Analysis**.
4. Select Subject Area **Payables Invoices – Transactions Real Time** → **OK**.
5. Expand **Invoices** (or *Invoice Details*) and double-click:
   - Invoice Currency
   - Invoice Currency Name
   - Invoice Amount
   - Invoice Amount Paid
6. Click the **Results** tab.

**Result:** ❌ **No Results** – the user does not have **data access**.

### Part E – Provide data access to the user

1. Sign out and sign in as the **admin user** – or stay signed in as your user since you have *IT Security Manager*.
2. Click your **user name (top-right) > Setup and Maintenance**.
3. Click the **Tasks** icon (right side) → **Search**.
4. Search: **Manage Data Access for Users** → click the task.
5. Select **Users with Data Access** (or *Users without Data Access*), enter your username → **Search**.
6. Click **+ (Create)** and enter:

| Field | Value |
|-------|-------|
| User Name | your username |
| Role | **Accounts Payable Manager** |
| Security Context | **Business Unit** |
| Security Context Value | **US1 Business Unit** |

7. Click **Save and Close**.
8. (Recommended) run **Import User and Role Application Security Data** again from Scheduled Processes.

### Part F – Test again: analysis WITH data access

1. Sign in with your user.
2. **Tools > Reports and Analytics > Browse Catalog > Create > Analysis**.
3. Subject Area **Payables Invoices – Transactions Real Time**.
4. Add the same columns: Invoice Currency, Invoice Currency Name, Invoice Amount, Invoice Amount Paid.
5. Click **Results**.

**Result:** ✅ **You can now view the data** for US1 Business Unit.

6. Save the analysis in **My Folders > Sulaiman** as `Analysis_Invoices_DataAccess_Sulaiman`.

---

## 4. Expected result

| Moment | Result |
|--------|--------|
| Before data access | No data / No results |
| After data access (AP Manager – US1 Business Unit) | Invoice data is displayed |

---

## 5. Troubleshooting

| Problem | Fix |
|---------|-----|
| User can’t see Reports and Analytics | Run *Import User and Role Application Security Data*, sign out and in again. |
| Role not found in Data Access | The role must be assigned to the user first (Part B). |
| Still no data | Wait a few minutes, sign out / in. Check the Business Unit value is exactly *US1 Business Unit*. |

---

## 6. Completion checklist

- [ ] Your user created
- [ ] Roles assigned: IT Security Manager, Employee, Accounts Payable Manager
- [ ] Import User and Role Application Security Data – Succeeded
- [ ] Analysis showed **no data** before data access
- [ ] Data access created: AP Manager / Business Unit / US1 Business Unit
- [ ] Analysis shows **data** after data access
