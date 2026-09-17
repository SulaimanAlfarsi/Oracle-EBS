# Changing Field Name in EBS

1. Login to **EBS**.

2. Navigate to:
   **System Administrator → Security → User → Define**

3. Go to:
   **View → Query by Example → Enter**

   Search for:

   ```text
   SULAIMAN%
   ```

   Then go to:
   **View → Query by Example → Run**

4. Add the responsibility:
   **Human Resources, Vision Enterprises**

5. Navigate to:
   **People → Enter and Maintain**

6. Click on the field that you want to change.

7. Go to:
   **Help → Diagnostics → Examine**

   Note down the **Block** and **Field** names:

   ```text
   Block: Person
   Field: LAST_NAME
   ```

8. Go to:
   **Help → Diagnostics → Custom Code → Personalize**

9. Enter:

   ```text
   Seq: 15
   Description: CHANGING LAST NAME FIELD
   Level: Function
   ```

10. Click the **Actions** tab and enter:

```text
Seq: 1
Type: Property
Language: All
Object Type: Item
Target Object: PERSON.LAST_NAME
Property Name: PROMPT_TEXT
Value: Last Name
```

11. Click **Validate**, then **Apply Now**, and **Save**.
