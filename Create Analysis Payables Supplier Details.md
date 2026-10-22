# Create Analysis: Payables Supplier Details

**Student:** Sulaiman
**Module:** Oracle Fusion Cloud – OTBI (Oracle Transactional Business Intelligence)
**Source guides:** Day 32 (OTBI intro), Day 33 (Analysis_Payables_Supplier)

---

## 1. Objective

Create an **OTBI Analysis** that shows supplier details from Payables in **real time**.

| | BIP | OTBI |
|--|-----|------|
| Data | Data model (query / spreadsheet / subject area) | **Subject Areas** – real-time data |
| Object | Report | **Analysis**, Dashboard |

---

## 2. Prerequisites

- Your user has the roles **Employee**, **Accounts Payable Manager** (plus HCM/HR roles from Day 33 if given).
- Data access for **Accounts Payable Manager** has been granted (see the *Give Data Access to Your User* task).

---

## 3. Objects you will create

| Object | Name |
|--------|------|
| Analysis | `Analysis_Payables_Supplier` |
| Folder | `My Folders > Sulaiman` |

---

## 4. Steps

### Step 1 – Login and open the catalog

1. Sign in with your user.
2. **Navigator > Tools > Reports and Analytics**.
3. Click **Browse Catalog**.

### Step 2 – Start a new Analysis

1. Click **Create** (global header) → **Analysis** (blue icon – OTBI).
2. In **Select Subject Area**, choose **Payables Invoices – Transactions Real Time**.

### Step 3 – Select the columns

1. In the **Subject Areas** pane (left), expand the **Supplier** folder.
2. Double-click (or drag to *Selected Columns*):
   - **Supplier** (Supplier Name)
   - **Supplier Type**
   - **Supplier Number**
3. (Optional – for more detail) also add from **Supplier**: *Supplier Site*, and from **Invoices**: *Invoice Amount*.

### Step 4 – Arrange the columns

1. In **Selected Columns**, drag to reorder: Supplier Number → Supplier → Supplier Type.
2. To sort: click the column’s ⚙ **options** → **Sort > Sort Ascending** on *Supplier*.

### Step 5 – View the results

1. Click the **Results** tab.
2. A table with supplier number, name and type is displayed.
3. (Optional) Click **New View > Graph > Bar** to show the number of suppliers by Supplier Type.

### Step 6 – Save the Analysis

1. Click **Save Analysis** (disk icon).
2. Location: **My Folders > Sulaiman**.
3. Name: `Analysis_Payables_Supplier` → **OK**.

### Step 7 – Reopen and check

1. **Catalog > My Folders > Sulaiman**.
2. Click **Open** on `Analysis_Payables_Supplier` → the supplier details show.

---

## 5. Expected result

A saved analysis listing **Supplier Number, Supplier name and Supplier Type** from Payables in real time.

---

## 6. Troubleshooting

| Problem | Fix |
|---------|-----|
| “No Results” | User needs data access (see the *Give Data Access to Your User* task). |
| Subject area not listed | User is missing the Accounts Payable role. |
| Can’t save | Need BI Author role (comes with AP Manager); save under My Folders. |

---

## 7. Completion checklist

- [ ] Subject area *Payables Invoices – Transactions Real Time* selected
- [ ] Columns Supplier, Supplier Type, Supplier Number added
- [ ] Results displayed
- [ ] Saved as `Analysis_Payables_Supplier` in My Folders > Sulaiman
