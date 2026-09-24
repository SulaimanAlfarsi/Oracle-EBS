# Create Bar Graph, Pie Chart, and Pivot Table in Oracle EBS

## RTF Template

1. Open the **RTF template** in Microsoft Word.

2. Load the **Sample XML**.

3. Go to the **BI Publisher** ribbon.

4. Select **Table Wizard**.

5. Select the required fields.

6. Create the following reports:

### Bar Chart

* Use:

  ```text
  SUM(SAL)
  ```
* Group by:

  ```text
  DEPTNO
  ```
* Select **Bar Chart**.

### Pie Chart

* Use:

  ```text
  SUM(SAL)
  ```
* Group by:

  ```text
  MGR
  ```
* Select **Pie Chart**.

### Pivot Table

* Select **Pivot Table**.
* Use:

  ```text
  DEPTNO
  ```

  as the row/group field.
* Use:

  ```text
  MGR
  ```

  as the column/group field.
* Use:

  ```text
  SUM(SAL)
  ```

  as the value.

7. Finish the wizard.

8. Format the charts and pivot table as required.

9. Save the template as:

   ```text
   SULAIMAN_MASTER_DETAIL.rtf
   ```

10. Preview the report and check the output.

## Chart Examples

### Bar Chart

```text
SUM(SAL) → DEPTNO
```

Shows the **total salary for each department**.

### Pie Chart

```text
SUM(SAL) → MGR
```

Shows the **salary distribution by manager**.

### Pivot Table

```text
Rows    → DEPTNO
Columns → MGR
Value   → SUM(SAL)
```

Shows the **total salary for each manager within each department**.
