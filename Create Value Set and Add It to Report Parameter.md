# Create Value Set and Add It to Report Parameter

1. Login to **EBS**.

2. Navigate to:
   **Application Developer → Application → Validation → Set**

   Create the Value Set:

   ```text
   Value Set Name: SULAIMAN_VS_DNO
   List Type: List of Values
   Security Type: No Security
   Format: Number
   Maximum Size: 4
   Validation Type: Table
   ```

   Click **Edit Information** and enter:

   ```text
   Table Name: EMP
   Value: DEPTNO
   Type: NUMBER
   Size: 4
   ```

   Click **Save**.

3. Go to:
   **Application Developer → Concurrent → Program**

   Search for the report parameter program:

   ```text
   TIBYAN_PARA_REP_PG
   ```

   Click **Parameters** and set:

   ```text
   Value Set: SULAIMAN_VS_DNO
   ```

   Click **Save**.

4. Create a **Request** and run the report.

5. View the **Output** to check the result.
