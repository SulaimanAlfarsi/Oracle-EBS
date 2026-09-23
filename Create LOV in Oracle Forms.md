# Create LOV in Oracle Forms

1. Open `SULAIMAN_EMP.fmb` and save it as:

   ```text
   SULAIMAN_EMP_LOV.fmb
   ```

2. Click **LOVs** and open the **LOV Wizard**.

3. Select:
   **New Record Group Based on a Query**

4. Enter the query:

   ```sql
   SELECT DEPTNO FROM EMP
   ```

5. Move `DEPTNO` to **LOV Columns**.

6. Set the **Return Value**:

   ```text
   Look Up Return Item: EMP.DEPTNO
   ```

7. Set the title:

   ```text
   LOV FOR DEPTNO
   ```

8. Move `EMP.DEPTNO` to **Assigned Items**.

9. Click **Finish**.

10. **Save and Compile** the form.

11. **Register the form in EBS**.

12. Go to the required **Responsibility** and run the form.

13. Click:

**View → Clear**

14. Enter the required values in the fields and click **Save** to insert a new record.

15. Check the database using:

```sql
SELECT * FROM EMP;
```

The new record should appear in the `EMP` table.
