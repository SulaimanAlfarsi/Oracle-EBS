# Create a Data Model Using an Analysis

**Student:** Sulaiman
**Module:** Oracle Fusion Cloud – BIP + OTBI
**Source guide:** Day 33 (Create Data Model based on Analysis)

---

## 1. Objective

Reuse an existing **OTBI Analysis** as the data source for a **BIP Data Model**, then build a BIP **Report** on it.

```
Analysis_Payables_Supplier  ──►  DM_Analysis_Payables_Supplier  ──►  Report_Payables_Supplier
       (OTBI)                         (BIP Data Model)                    (BIP Report)
```

---

## 2. Prerequisites

- *Create Analysis Payables Supplier Details* task done: `Analysis_Payables_Supplier` is saved in **My Folders > Sulaiman**.
- Your user with Accounts Payable Manager role + data access.

---

## 3. Objects you will create

| Object | Name |
|--------|------|
| Data Model | `DM_Analysis_Payables_Supplier` |
| Report | `Report_Payables_Supplier` |
| Folder | `My Folders > Sulaiman` |

---

## 4. Steps

### Step 1 – Open Reports and Analytics

1. Sign in with your user.
2. **Navigator > Tools > Reports and Analytics > Browse Catalog**.

### Step 2 – Create the Data Model

1. Click **Create > Data Model** (Published Reporting).
2. Under **Data Sets** click **+ (New Data Set)**.
3. Select **Oracle BI Analysis** (*Select > Analysis*).
4. In the dialog:
   - **Name:** `DS_Supplier_Analysis`
   - **Analysis:** click 🔍 browse → **My Folders > Sulaiman > Analysis_Payables_Supplier** → **OK**
   - **Time Out:** leave default
5. Click **OK**.
   The data set is created with the analysis columns: Supplier, Supplier Type, Supplier Number.

### Step 3 – Design the required columns

1. In the diagram, check the data set columns.
2. (Optional) Click a column’s menu to **rename** the XML element / display name, e.g. `SUPPLIER_NAME`, `SUPPLIER_TYPE`, `SUPPLIER_NUMBER`.
3. Remove any column you do not need.

### Step 4 – Test and save sample data

1. Click the **Data** tab → **View**.
2. Rows from the analysis are shown in XML/table format.
3. Click **Save As Sample Data**.

### Step 5 – Save the Data Model

1. Click **Save** → **My Folders > Sulaiman**.
2. Name: `DM_Analysis_Payables_Supplier` → **OK**.

### Step 6 – Create a Report based on the Data Model

1. Click **Create > Report**.
2. **Use Data Model** → browse **My Folders > Sulaiman > DM_Analysis_Payables_Supplier** → **OK**.
3. Choose **Guide Me** → **Next**.
4. Layout: **Table** (or **Table & Chart**) → **Next**.
5. Drag Supplier Number, Supplier, Supplier Type into the table.
   For a chart: put *Supplier Type* on the axis and a count of *Supplier Number* as the value → **Next**.
6. Select **Run Report** → **Finish**.

### Step 7 – Save the Report

1. Click **Save** → **My Folders > Sulaiman**.
2. Name: `Report_Payables_Supplier` → **OK**.

### Step 8 – View the Report

1. **Catalog > My Folders > Sulaiman > Report_Payables_Supplier > Open**.
2. The supplier details (from the analysis) are shown as a BIP report.
3. (Optional) Use the **Actions (⚙) > Export** menu to download PDF / Excel.

---

## 5. Expected result

A BIP report that displays the same supplier data as the OTBI analysis, because its data model uses the analysis as its source.

---

## 6. Troubleshooting

| Problem | Fix |
|---------|-----|
| Analysis not visible in browse | Make sure it is saved in My Folders > Sulaiman (or a shared folder you can access). |
| Data tab returns no rows | Open the analysis itself – if it has no data, fix data access (see the *Give Data Access to Your User* task). |
| Report has no fields | Save sample data in the data model and reopen the report. |

---

## 7. Completion checklist

- [ ] Data set type **Oracle BI Analysis** using `Analysis_Payables_Supplier`
- [ ] Sample data saved
- [ ] Data model `DM_Analysis_Payables_Supplier` saved
- [ ] Report `Report_Payables_Supplier` created and saved
- [ ] Report opened and data shown
