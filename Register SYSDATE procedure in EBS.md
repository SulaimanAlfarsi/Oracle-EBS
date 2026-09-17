# EBS Procedure

```sql
CREATE OR REPLACE PROCEDURE SULAIMAN_PR_SYSDT (
    ERRBUF  OUT VARCHAR2,
    RETCODE OUT NUMBER
) IS
    V_DT DATE;
BEGIN
    SELECT SYSDATE INTO V_DT FROM DUAL;

    FND_FILE.PUT_LINE(
        FND_FILE.LOG,
        'YOU CAN SEE LOG DETAILS HERE!'
    );

    FND_FILE.PUT_LINE(
        FND_FILE.OUTPUT,
        'CURRENT DATE = ' || V_DT
    );

EXCEPTION
    WHEN OTHERS THEN
        FND_FILE.PUT_LINE(
            FND_FILE.OUTPUT,
            'CHECK YOUR PROGRAM: ' || ERRBUF ||
            ' ERRCODE=' || RETCODE
        );
END;
/
```

# Steps

1. **Login to EBS.**

2. Create an **Executable**:
   **Application Developer → Concurrent → Executable**

   Enter:

   ```text
   Name: SULAIMAN_PR_SYSDT
   Short Name: SULAIMAN_PR_SYSDT
   Application: AOL
   Execution Method: PL/SQL Stored Procedure
   Execution File Name: SULAIMAN_PR_SYSDT
   ```

   Click **Save**.

3. To check the executable, go to:

   **View → Query by Example → Enter**

   Enter:

   ```text
   Name: SULAIMAN_PR_SYSDT
   ```

4. Then go to:

   **View → Query by Example → Run**

   You can see the executable details.

5. Create a **Concurrent Program**:
   **Application Developer → Concurrent → Program**

   Enter:

   ```text
   Name: SULAIMAN_PR_SYSDT_PG
   Short Name: SULAIMAN_PR_SYSDT_PG
   Application: AOL
   Executable: SULAIMAN_PR_SYSDT
   Output Format: HTML
   ```

   Click **Save**.

6. Add the program to the existing **Request Group**:

   **System Administrator → Security → Responsibility → Request**

   Search for:

   ```text
   Name: SULAIMAN_RG_PGMS
   Application: AOL
   ```

   Add:

   ```text
   Program: SULAIMAN_PR_SYSDT_PG
   ```

   Click **Save**.

7. Create a **Request**:

   Switch to your responsibility, then go to:

   **View → Request → Submit a New Request → Single Request → OK**

8. Click the **LOV** and select:

   ```text
   SULAIMAN_PR_SYSDT_PG
   ```

9. Click **Submit**.

10. Go to **Find → View Output** to see the current date.
