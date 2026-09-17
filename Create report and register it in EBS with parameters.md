# Oracle Report with a Parameter

1. Open **Oracle Reports Builder** and start the **Report Wizard**.

2. Create both **Web Layout** and **Paper Layout**.

3. Select **Tabular** layout.

   ```text
   Name: EMP DETAILS BASED ON DEPTNO
   ```

4. Select **SQL Query**.

5. Connect to the database by entering your **username, password, and database**.

6. Use the following SQL query:

   ```sql
   SELECT * FROM EMP WHERE DEPTNO = :DNO
   ```

7. Select the fields that you want to display.

8. Select the required **aggregate functions**.

9. Select your preferred **theme**.

10. Enter a **DEPTNO** and click **Run** to test the report.

11. Save the report as:

```text
SULAIMAN_PARA_REP.rdf
```

# Register the Report in Oracle EBS

### A. Move the `.rdf` File

1. Use **WinSCP** to move the `.rdf` file to:

   ```text
   /u01/install/VISION/fs1/EBSapps/appl/fnd/12.0.0/reports/US
   ```

### B. Create an Executable

Go to:

**Application Developer → Concurrent → Executable**

Enter:

```text
Executable: SULAIMAN_PARA_REP
Short Name: SULAIMAN_PARA_REP
Application: AOL
Execution Method: Oracle Reports
Execution File Name: SULAIMAN_PARA_REP
```

Click **Save**.

### C. Create a Concurrent Program

Go to:

**Application Developer → Concurrent → Program**

Enter:

```text
Program: SULAIMAN_PARA_REP_PG
Short Name: SULAIMAN_PARA_REP_PG
Application: AOL
Executable Name: SULAIMAN_PARA_REP
Format: HTML
Style: A4
```

Click **Save**.

### D. Add the Parameter

Click **Parameters** and enter:

```text
Seq: 1
Parameter: DNO
Value Set: NUMBER_15
Token: DNO
```

Click **Save**.

### E. Add the Program to the Request Group

1. Go to **System Administrator → Security → Responsibility → Request**.

2. Use **View → Query by Example → Enter**.

3. Search for the required **Request Group**.

4. Add the concurrent program:

   ```text
   SULAIMAN_PARA_REP_PG
   ```

5. Click **Save**.

### F. Run the Report

1. Switch to the required **Responsibility**.

2. Create a new **Request**.

3. Select:

   ```text
   SULAIMAN_PARA_REP_PG
   ```

4. Enter the **DNO** parameter.

5. Submit the request.

6. View the **Output**.
