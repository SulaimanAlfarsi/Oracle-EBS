# Register Oracle Form in EBS

### A. Move the `.fmx` File

Move the `.fmx` file to the EBS server using **WinSCP**:

```text
fnd/12.0.0/forms/US
```

### B. Create a Form

1. Login to **EBS**.

2. Navigate to:
   **Application Developer → Application → Form**

3. Enter:

```text
Form: SULAIMAN_EMP
Application: AOL
User Form Name: SULAIMAN_EMP
```

Click **Save**.

4. To check if the form was created, go to:

**View → Query by Example → Enter**

Enter:

```text
Name: SULAIMAN_EMP
```

Then:

**View → Query by Example → Run**

### C. Create a Function

1. Navigate to:
   **Application Developer → Application → Function**

2. Enter:

```text
Function: SULAIMAN_EMP
User Function Name: SULAIMAN_EMP
```

3. Click the **Form** tab and enter:

```text
Function: SULAIMAN_EMP
Form: SULAIMAN_EMP
```

Click **Save**.

### D. Create a Menu

Navigate to:

**Application Developer → Application → Menu**

Enter:

```text
Menu: SULAIMAN_FORM_MENU
User Menu Name: SULAIMAN_FORM_MENU

Seq: 1
Prompt: EMP
Function: SULAIMAN_EMP
```

Click **Save**.

### E. Create a New Responsibility

Navigate to:

**System Administrator → Security → Responsibility → Define**

Enter:

```text
Name: SULAIMAN_FORM_RESP
Application: AOL
Responsibility Key: SULAIMAN_FORM_RESP_KEY
```

Enter:

```text
Name: Standard
Application: AOL
Menu: SULAIMAN_FORM_MENU
```

Click **Save**.

### F. Assign the Responsibility to a User

1. Navigate to:
   **System Administrator → Security → User → Define**

2. Go to:
   **View → Query by Example → Enter**

3. Enter:

```text
User: SULAIMAN
```

4. Go to:
   **View → Query by Example → Run**

5. Add the responsibility:

```text
SULAIMAN_FORM_RESP
```

6. Save.

### G. Open the Form

Navigate to the:

**SULAIMAN_FORM_RESP** responsibility.

The **EMP** option should be available in the menu.
