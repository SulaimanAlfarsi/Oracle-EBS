# Oracle Fusion Cloud — Create a User and Assign Roles

## 1. Navigator Overview

Open **Navigator → Tools** to access these tools:

- **Security Console:** Create users, manage roles, and assign roles. Usually available to administrator users with the required security privileges.
- **Scheduled Processes:** Run background processes.
- **Reports and Analytics:** Access BI Publisher (BIP) reports and Oracle Transactional Business Intelligence (OTBI) analyses and dashboards.
- **AI Agent Studio:** Create and manage AI agents, depending on your access.

### Common Roles

- **IT Security Manager:** An administrative role used for security management. Assign it only when the user requires and is authorized for those privileges.
- **BI Author / BI Consumer:** Roles related to creating or viewing business intelligence content. The exact access depends on the role configuration.

> **Important:** Role availability and permissions depend on the Fusion environment and your organization's security configuration.

## 2. Sign In to the Fusion Environment

Use the administrator account supplied for your training environment.

- **Administrator username:** `A.A`
- **Password:** Use the password provided by your instructor or administrator.

Do not put real passwords in shared notes or commit them to a public repository.

## 3. Review the Administrator's Roles

1. Sign in as `A.A`.
2. Open **Navigator → Tools → Security Console**.
3. Open **Users** and search for `A.A`.
4. Open the user record.
5. Review the roles assigned to the account.
6. Select **Roles** to inspect role details.

### Role Naming Notes

- Many predefined Oracle Fusion roles use the `ORA_` prefix.
- Some older or application-specific roles may use other prefixes, such as `FND_`.
- Do not select a role based only on its prefix. Confirm that the role is appropriate for the task and follows your organization's naming and security standards.
- Role categories can include **job roles**, **abstract roles**, and **duty roles**. A job role commonly grants job-related access; an abstract role may represent a user type or employment relationship; duty roles group specific duties or privileges.

## 4. Create the User `sulaiman.alfarsi`

1. Sign in as the authorized administrator.
2. Open **Navigator → Tools → Security Console**.
3. Select **Users**.
4. Click **Add User Account**.
5. Enter the following details:

   - **First Name:** Sulaiman
   - **Last Name:** Alfarsi
   - **Username:** `sulaiman.alfarsi`
   - **Password:** Set a password according to your organization's password policy.

6. Review any other required fields, such as email, user category, or person information, according to your training environment.
7. Click **Save and Close**.

## 5. Sign In as the New User

1. Sign out of the administrator account.
2. Sign in with username `sulaiman.alfarsi` and the password set during account creation.
3. If the account has no roles assigned, the user may not see the expected Navigator tools or may be unable to access Fusion functions.

## 6. Assign Roles to `sulaiman.alfarsi`

1. Sign out and sign in again as the authorized administrator.
2. Open **Navigator → Tools → Security Console**.
3. Search for and open user `sulaiman.alfarsi`.
4. Open the **Roles** section.
5. Click **Add Role** or the equivalent action in your Fusion version.
6. Search for the role required by the lab or business need.
7. Select the appropriate role or roles, then confirm the selection.
8. Click **Save and Close**.

### Example Roles for Training

- **Employee** — an abstract role that may be appropriate when the user should have employee-level access.
- **IT Security Manager** — a highly privileged administrative role. Assign it only if the training task explicitly requires it and the account is authorized to manage security.

> **Security best practice:** Do not assign `IT Security Manager` just to make tools appear. Use least privilege and assign only the roles needed for the user's duties. In a real environment, have the security administrator approve privileged access.

## 7. Verify the Role Assignment

1. Sign out of the administrator account.
2. Sign in as `sulaiman.alfarsi`.
3. Open **Navigator** and check the tools available to the user.
4. If needed, return to **Security Console → Users → sulaiman.alfarsi → Roles** as an administrator to confirm the assigned roles.
5. If access does not appear immediately, follow your organization's Fusion access troubleshooting process.

## 8. Password Policy and User Category

- Follow the organization's password policy when setting or resetting the user's password.
- The **User Category** may be set to **Default** in a training environment.
- Choose a different user category only when required by the client or administrator's configuration.
- Save any changes.

## 9. Reports and Analytics

Open **Navigator → Tools → Reports and Analytics** to access reporting features available to your account.

- **BI Publisher (BIP):** Used to create formatted, pixel-perfect reports and documents.
- **OTBI:** Used to build analyses, reports, and dashboards from supported subject areas.

Your ability to create or view content depends on the BI roles and permissions assigned to your account.

## 10. Oracle Learning and Documentation

- Oracle MyLearn: <https://mylearn.oracle.com/>
  - Learning materials
  - Certification preparation
  - Subscriptions, where available

- Oracle Documentation: <https://docs.oracle.com/en/>
  - Product documentation and reference materials

- Oracle Certification: <https://www.oracle.com/certification/>

## Lab Checklist

- [ ] Sign in as the administrator.
- [ ] Open Security Console.
- [ ] Review the administrator's assigned roles.
- [ ] Create user `sulaiman.alfarsi`.
- [ ] Sign in as the new user and check access.
- [ ] Return as administrator and assign the approved roles.
- [ ] Sign in again as `sulaiman.alfarsi`.
- [ ] Verify assigned roles and available tools.
- [ ] Check Reports and Analytics access.
