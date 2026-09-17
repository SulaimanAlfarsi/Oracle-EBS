# Oracle Report

1. Open **Report Wizard**.

2. Create both **Web Layout** and **Paper Layout**.

3. Select **Tabular**.

   ```text
   Name: EMP DETAILS REPORT
   ```

4. Select **SQL Query**.

5. Connect to the database by entering the **username, password, and database**.

6. Open **Query Builder**, search for the table name, and click **Include**.

7. Select the fields that you want to display.

8. Select the required **aggregate functions**.

9. Select your preferred **theme**.

10. Save the report as a `.rdf` file:

```text
SULAIMAN_EMP.rdf
```

# Register the Report in Oracle EBS

### A. Move the `.rdf` File

Move the `.rdf` file to the EBS server using **WinSCP**:

```text
fnd/12.0.0/reports/US
```

### B. Create an Executable

Go to:

**Application Developer → Concurrent → Executable**

Enter:

```text
Executable: SULAIMAN_EMP
Short Name: SULAIMAN_EMP
Application: AOL
Execution Method: Oracle Reports
Execution File Name: SULAIMAN_EMP
```

Click **Save**.

### C. Create a Concurrent Program

Go to:

**Application Developer → Concurrent → Program**

Enter:

```text
Program: SULAIMAN_EMP_PG
Short Name: SULAIMAN_EMP_PG
Application: AOL
Executable Name: SULAIMAN_EMP
Format: HTML
Style: A4
```

Click **Save**.

### D. Add the Program to the Request Group

1. Go to the existing request group.

2. Use:
   **View → Query by Example → Enter**

3. Search for:

   ```text
   Group: SULAIMAN_RG_PGMS
   ```

4. Click:
   **View → Query by Example → Run**

5. Add:

   ```text
   SULAIMAN_EMP_PG
   ```

6. Click **Save**.

### E. Run the Report

1. Switch to the required **Responsibility**.

2. Create a new **Request**.

3. Select the report.

4. Submit the request.

5. View the **Output**.
