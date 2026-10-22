# Create a BIP Report with a Parameter

**Student:** Sulaiman
**Module:** Oracle Fusion Cloud – BI Publisher (BIP) Reports
**Source guides:** Day 28 (BIP Reports in Fusion), Day 29 (Parameter Report – Lab 1)

---

## 1. Objective

Build a BI Publisher report that filters its data by a value the user types in at run time.
The parameter acts as the **WHERE clause (condition)** of the data model query.

| Term | Meaning |
|------|---------|
| Data Model (DM) | The query that pulls the data (e.g. `SELECT * FROM EMP`) |
| Parameter | The filter – the `WHERE` condition, written as a bind variable `:BU_NAME` |
| Report | The layout (table / chart) built on top of the data model |

---

## 2. Objects you will create

| Object | Name |
|--------|------|
| Folder | `My Folders > Sulaiman` |
| Data Model | `DM_BU_AbsenceMgmt_Sulaiman` |
| Parameter | `BU_NAME` |
| Report | `Report_AbsenceMgmt_BU_Sulaiman` |

---

## 3. Login

1. Open the Fusion URL given by your instructor.
2. Enter **your username** and **your password**.
3. Click **Sign In**.

---

## 4. Steps

### Step 1 – Open Reports and Analytics

1. Click the **Navigator** (☰ icon, top-left).
2. Go to **Tools > Reports and Analytics**.
3. Click **Browse Catalog**. The BI catalog opens in a new tab.

> **Catalog reminder**
> - **My Folders** – private, only the logged-in user sees it.
> - **Shared Folders** – public to all users who log in.

### Step 2 – Create your personal folder

1. In the left **Folders** pane, select **My Folders**.
2. Click **New > Folder**.
3. Name: `Sulaiman` → **OK**.

### Step 3 – Create the Data Model

1. In the global header, click **Create**.
   - **Yellow icons** = BIP (Published Reporting) objects.
   - **Blue icons** = OTBI (Analysis) objects.
2. Under **Published Reporting**, click **Data Model**.
3. In the Data Model editor, under **Data Sets**, click the **+ (New Data Set)** icon → **SQL Query**.
4. Fill in the dialog:
   - **Name:** `DS_BU`
   - **Data Source:** `OBIEE` (Oracle BI EE – lets you query Subject Areas)
5. Click **Query Builder**.
6. In **Catalog / Subject Area**, choose **Absence Management – Availability Patterns Real Time**.
7. Expand the **Business Unit** folder and tick these columns:
   - Business Unit Id
   - Business Unit Name
   - Status
   - Business Unit Status Code
8. Click **Save** in the Query Builder – the SQL is generated in the dialog.

### Step 4 – Add the parameter (WHERE clause)

1. At the end of the generated SQL, add the condition `WHERE "Business Unit"."Business Unit Name" = :BU_NAME`.
   The complete query must look like this:

```sql
select "Business Unit"."Business Unit Id"          as "Business Unit Id",
       "Business Unit"."Business Unit Name"        as "Business Unit Name",
       "Business Unit"."Status"                    as "Status",
       "Business Unit"."Business Unit Status Code" as "Business Unit Status Code"
from   "Absence Management - Availability Patterns Real Time"."Business Unit" "Business Unit"
WHERE  "Business Unit"."Business Unit Name" = :BU_NAME
```

2. Click **OK**.
3. BIP detects the bind variable `:BU_NAME` and asks to create the parameter → click **OK**.
   The parameter **BU_NAME** now appears under **Parameters** in the left pane.

### Step 5 – Check the parameter properties

1. In the left pane, click **Parameters > BU_NAME**.
2. Confirm:
   - **Data Type:** String
   - **Parameter Type:** Text
   - **Display Label:** `Business Unit Name`
   - **Default Value:** leave empty (or type `Qatar Business Unit` for testing)

### Step 6 – Test the data and save sample data

1. Click the **Data** tab (top-right of the editor).
2. Enter `BU_NAME` = `Qatar Business Unit` → click **View**.
3. Confirm that rows are returned.
4. Click **Save As Sample Data** (this saves the XML data so the report designer can use it).

### Step 7 – Save the Data Model

1. Click **Save** (disk icon, top-right).
2. Location: **My Folders > Sulaiman**.
3. Name: `DM_BU_AbsenceMgmt_Sulaiman` → **OK**.

### Step 8 – Create the Report

1. Click **Create > Report** (Published Reporting).
2. Choose **Use Data Model** → browse to **My Folders > Sulaiman > DM_BU_AbsenceMgmt_Sulaiman** → **OK**.
   > Other options on this screen (for reference): **Upload Spreadsheet** and **Subject Area**.
3. Select **Guide Me** (or **Use Report Editor**) → **Next**.
4. Layout: choose **Table** (or **Table & Chart**) → **Next**.
5. Drag all four columns into the table → **Next**.
6. Select **Run Report** → **Finish**.
7. Save the report in **My Folders > Sulaiman** as `Report_AbsenceMgmt_BU_Sulaiman`.

### Step 9 – Run the report with the parameter

1. Go to **Catalog > My Folders > Sulaiman**.
2. Click **Open** on `Report_AbsenceMgmt_BU_Sulaiman`.
3. In the parameter box at the top, type:
   - **BU_NAME:** `Qatar Business Unit`
4. Click **Apply**.

---

## 5. Expected result

The report is displayed and shows **only** the row(s) for *Qatar Business Unit*.
Change the value (for example to another Business Unit name) and click **Apply** again – the output changes.

---

## 6. Troubleshooting

| Problem | Fix |
|---------|-----|
| No rows returned | The value is case- and space-sensitive. Type the Business Unit name exactly as it appears in the data. |
| Parameter not created | Make sure the bind variable starts with a colon: `:BU_NAME`. |
| Report says “No sample data” | Go back to the data model, run it on the **Data** tab and click **Save As Sample Data**. |

---

## 7. Completion checklist

- [ ] Folder `Sulaiman` created under My Folders
- [ ] Data model created with `WHERE ... = :BU_NAME`
- [ ] Parameter `BU_NAME` exists
- [ ] Sample data saved
- [ ] Report created and saved
- [ ] Report run with `Qatar Business Unit` and filtered data shown
