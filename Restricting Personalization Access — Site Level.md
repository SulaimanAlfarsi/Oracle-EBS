# Restricting Personalization Access — Site Level

1. Login to **EBS**.

2. Navigate to:
   **System Administrator → Profile → System**

3. Set:

   ```text
   Display: Site
   Profile: UTIL%
   ```

4. Click **Find**.

5. Set the following profile options:

   ```text
   Profile Option Name: Utilities:Diagnostics
   Site: No

   Profile Option Name: Utilities:SQL Trace
   Site: No
   ```

6. Save the changes.

7. To test, go back to the **Responsibility** and try to personalize the form.

8. An **error message** should appear because personalization access is restricted.

---

# Restricting Personalization Access — User Level

1. Login to **EBS**.

2. Navigate to:
   **System Administrator → Profile → System**

3. Set:

   ```text
   Display: User
   User: SULAIMAN
   Profile: UTIL%
   ```

4. Click **Find**.

5. Set the following profile options:

   ```text
   Profile Option Name: Utilities:Diagnostics
   Site: No

   Profile Option Name: Utilities:SQL Trace
   Site: No
   ```

6. Save the changes.


7. An **error message** should appear.
