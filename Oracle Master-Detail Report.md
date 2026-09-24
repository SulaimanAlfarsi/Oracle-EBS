# Oracle Master-Detail Report

1. Open **Report Wizard**.

2. Create both **Web Layout** and **Paper Layout**.

3. Select **Group Above**.

   ```text
   Name: SULAIMAN MASTER DETAIL REPORT
   ```

4. Select **SQL Query**.

5. Connect to the database using your **username, password, and database**.

6. Open **Query Builder** and search for the tables:

   ```text
   DEPT
   EMP
   ```

   Then click **Include**.

7. Select the field to be **grouped**, then select all the fields that you want to display.

8. Select the required **aggregate functions**.

9. Select your preferred **theme**.

10. Save the report as:

```text
SULAIMAN_MASTER_DETAIL_REP.rdf
```

# Register the Report in Oracle EBS

### A. Move the `.rdf` File

1. Use **WinSCP** to move the `.rdf` file to the EBS server:

   ```text
   fnd/12.0.0/reports/US
   ```

### B. Create an Executable

Go to:

**Application Developer → Concurrent → Executable**

Enter:

```text
Executable: SULAIMAN_MASTER_DETAIL_REP
Short Name: SULAIMAN_MASTER_DETAIL_REP
Application: AOL
Execution Method: Oracle Reports
Execution File Name: SULAIMAN_MASTER_DETAIL_REP
```

Click **Save**.

### C. Create a Concurrent Program

Go to:

**Application Developer → Concurrent → Program**

Enter:

```text
Program: SULAIMAN_MASTER_DETAIL_REP
Short Name: SULAIMAN_MASTER_DETAIL_REP
Application: AOL
Executable Name: SULAIMAN_MASTER_DETAIL_REP
Format: XML
Style: A4
```

Click **Save**.

### D. Add the Program to the Request Group

1. Go to the existing **Request Group**.

2. Select:
   **View → Query by Example → Enter**

3. Search for:

   ```text
   Group: SULAIMAN_RG_PGMS
   ```

4. Select:
   **View → Query by Example → Run**

5. Add:

   ```text
   SULAIMAN_MASTER_DETAIL_REP
   ```

6. Click **Save**.

### E. Run the Report

1. Switch to the required **Responsibility**.

2. Create a new **Request**.

3. Select:

   ```text
   SULAIMAN_MASTER_DETAIL_REP
   ```

4. Submit the request.

5. View the **Output**.

6. Right-click on the output and select **Save Page**.

7. Save the file as:

   ```text
   SULAIMAN_MASTER_DETAIL_REP.xml
   ```

# Create BI Publisher Layout

1. Open a **Microsoft Word** document.

2. Go to the **BI Publisher** ribbon.

3. Select **Sample XML**.

4. Select:

   ```text
   SULAIMAN_MASTER_DETAIL_REP.xml
   ```

5. Select **Table Wizard**.

6. Select **Table**.

7. Select all the required fields.

8. Set the grouping field to:

   ```text
   DEPTNO
   ```

9. Finish the Table Wizard.

10. Save the BI Publisher template.

11. Review the report output and generate it as a **PDF**.
