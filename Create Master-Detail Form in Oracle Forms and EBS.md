# Create Master-Detail Form in Oracle Forms and EBS

### Create the Form

1. Using **WinSCP**, connect to the EBS server.

2. Navigate to:

   ```text
   /u01/install/VISION/fs1/EBSapps/appl/au/12.0.0/forms/US
   ```

3. Copy the `APSTAND.fmb` file to your machine.

4. Open **Oracle Forms Builder**.

5. Go to:
   **File → Open → APSTAND.fmb**

6. Save the form as:

   ```text
   SULAIMAN_MD.fmb
   ```

7. Right-click the module and select **Property Palette**.

   Change the name to:

   ```text
   SULAIMAN_MD
   ```

8. Delete the following:

   * Data Block: `BLOCKNAME`
   * Canvas: `BLOCKNAME`
   * Window: `BLOCKNAME`

### Create Window and Canvas

9. Create a new **Window**:

   ```text
   Name: SULAIMAN_MASTER_DETAIL_WINDOW
   ```

10. Create a new **Canvas**:

```text
Name: SULAIMAN_MD_CAN
```

### Create DEPT Data Block

11. Create a new **Data Block**.

12. Select **Table or View** and connect to the database.

13. Select the `DEPT` table.

14. Enter:

```text
Data Block Name: DEPT
Canvas: SULAIMAN_MD_CAN
```

15. Set the form properties:

```text
Frame Title: DEPARTMENT DETAILS
Records Displayed: 1
```

### Create EMP Data Block

16. Create another **Data Block**.

17. Select **Table or View** and select the `EMP` table.

18. Click **Create Relationship**.

19. Enter:

```text
Relationship: FK_DEPTNO
Disable Auto-Join
Detail Item: EMPNO
```

20. Set:

```text
Data Block Name: EMP
Canvas: SULAIMAN_MD_CAN
```

21. Select **Tabular** and set:

```text
Frame Title: EMPLOYEE DETAILS
Records Displayed: 5
```

### Save and Compile

22. Save the form.

23. Compile the form to create:

```text
SULAIMAN_MD.fmx
```

24. Using **WinSCP**, copy the `.fmx` file to:

```text
/u01/install/VISION/fs1/EBSapps/appl/fnd/12.0.0/forms/US
```

### Register the Form in EBS

25. Login to **EBS**.

26. Navigate to:
    **Application Developer → Application → Form**

27. Create the form:

```text
Form: SULAIMAN_MD
Application: Application Object Library
User Form Name: SULAIMAN_MD
```

Click **Save**.

### Create the Function

28. Navigate to:
    **Application Developer → Application → Function**

29. Create the function:

```text
Function: SULAIMAN_MD
User Function Name: SULAIMAN_MD
```

30. Go to the **Form** tab and enter:

```text
Form: SULAIMAN_MD
```

Click **Save**.

### Add Function to the Menu

31. Navigate to:
    **Application Developer → Application → Menu**

32. Query the existing menu:

**View → Query by Example → Enter**

Enter:

```text
Menu: SULAIMAN_FORM_MENU
```

33. Go to:

**View → Query by Example → Run**

34. Add:

```text
Seq: 5
Prompt: MD_FORM
Function: SULAIMAN_MD
```

35. Click **Save**.

### Run the Form

36. Go to the **SULAIMAN_RESP_FORM** responsibility.

37. Open:

```text
MD_FORM
```

The master-detail form should open with the **DEPT** master block and **EMP** detail block.
