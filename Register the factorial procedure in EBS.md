# Steps

1. **Login to EBS.**

2. Create an **Executable**:
   **Application Developer → Concurrent → Executable**

   ```text
   Executable: SULAIMAN_PR_FAC
   Short Name: SULAIMAN_PR_FAC
   Application: AOL
   Execution Method: PL/SQL Stored Procedure
   Execution File Name: SULAIMAN_PR_FAC
   ```

   Click **Save**.

3. Create a **Concurrent Program**:
   **Application Developer → Concurrent → Program**

   ```text
   Program: SULAIMAN_PR_FAC_PG
   Short Name: SULAIMAN_PR_FAC_PG
   Application: AOL
   Executable Name: SULAIMAN_PR_FAC
   Format: HTML
   Style: A4
   ```

   Click **Save**.

4. Click **Parameters** and enter:

   ```text
   Seq: 1
   Parameter: N
   Value Set: NUMBER_15
   ```

   Click **Save**.

5. Add the program to the existing **Request Group**.

   Go to:
   **System Administrator → Security → Responsibility → Request**

   Search for:

   ```text
   Group: SULAIMAN_PR_FAC_PG
   ```

   Add:

   ```text
   Program: SULAIMAN_PR_FAC_PG
   ```

   Click **Save**.

6. Switch to your **Responsibility** and create a new **Request**.

7. Select:

   ```text
   SULAIMAN_PR_FAC_PG
   ```

8. Enter a value for **N**.

9. Submit the request and view the **Output**.
