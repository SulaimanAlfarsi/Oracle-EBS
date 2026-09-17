# Create New User in EBS

1. Login to **EBS** with:
   **Username:** `OPERATIONS` (Admin User)

2. Go to:
   **System Administrator → Security → User → Define**

3. Enter a new **Username** and **Password**.
   Enter the password again to confirm it.

4. Add these responsibilities:

   * **Application Developer**
   * **System Administrator**

5. Click **Save**.

6. To check if the user was created, go to:
   **View → Query by Example → Enter**

7. Enter the username, then go to:
   **View → Query by Example → Run**

8. The new user will be stored in the **FND_USER** table.
