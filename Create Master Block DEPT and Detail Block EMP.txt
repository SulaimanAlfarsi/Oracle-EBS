# Create Master Block `DEPT` and Detail Block `EMP`

1. Open **Oracle Forms Builder**.

2. Create a **Canvas** called:
   `CAN_DEPT_EMP`

3. Create a **Data Block** called `DEPT` and place it on `CAN_DEPT_EMP`.

4. Create a **Data Block** called `EMP` and place it on `CAN_DEPT_EMP`.

5. A message will appear asking you to create a **relationship**.

6. Select **Remove Auto Join**, then click **Create Relationship**.

   * **Master Block:** `DEPT`
   * **Master Item:** `DEPTNO`
   * **Detail Item:** `DEPTNO`
   * **Join Displayed:** `EMP.DEPTNO = DEPT.DEPTNO`

7. **3 Triggers** and **3 Program Units** will be created automatically.

8. Save the form as:
   `SULAIMAN_MASTER_DETAIL.fmb`

9. Compile the form to create:
   `SULAIMAN_MASTER_DETAIL.fmx`
