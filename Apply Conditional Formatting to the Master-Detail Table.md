# Apply Conditional Formatting to the Master-Detail Table

## Conditional Formatting in RTF

1. Open the **Master-Detail RTF template** in Microsoft Word.

2. Load the **Sample XML**.

3. Select the **EMPLOYEE DETAILS** table.

4. Select the field you want to apply conditional formatting to, for example:

   ```text
   SAL
   ```

5. Go to the **BI Publisher** ribbon.

6. Select **Conditional Formatting**.

7. Create a condition, for example:

   ```text
   SAL > 3000
   ```

8. Set the formatting you want to apply when the condition is true.

9. Add another condition if required, for example:

   ```text
   SAL <= 3000
   ```

10. Apply the required formatting to each condition.

11. Save the template as:

```text
SULAIMAN_MASTER_DETAIL.rtf
```

12. Preview the report and check the output.

### Example

```text
SAL > 3000  → Apply special formatting
SAL <= 3000 → Normal formatting
```

The formatting will be applied automatically based on the employee's salary.
