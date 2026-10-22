# Create a Dashboard

**Student:** Sulaiman
**Module:** Oracle Fusion Cloud – OTBI
**Source guides:** Day 32 (Dashboards), Day 33 (Create New Dashboard)

---

## 1. Objective

A **Dashboard** is a collection of related **Analyses and Reports**.

- It consists of **pages**.
- It stores Reports and Analyses and **categorises** them.
- It can be **exported**.

You will build a dashboard that brings together the analyses and reports from the previous tasks.

---

## 2. Prerequisites

Objects already saved in **My Folders > Sulaiman**:

| From | Object |
|------|--------|
| *Create Analysis Payables Supplier Details* task | `Analysis_Payables_Supplier` |
| *Create Analysis with Prompt* task | `Analysis_Supplier_Prompt` |
| *Create a Data Model Using Analysis* task | `Report_Payables_Supplier` |
| *Create Report with Parameter* / *Create Report with Parameter and LOV* tasks | `Report_AbsenceMgmt_BU_Sulaiman`, `Report_PAR_LOV_Sulaiman` (optional) |

---

## 3. Objects you will create

| Object | Name |
|--------|------|
| Dashboard | `DB_Sulaiman` |
| Page 1 | `Payables` |
| Page 2 (optional) | `BIP Reports` |
| Folder | `My Folders > Sulaiman` |

---

## 4. Steps

### Step 1 – Login and open the catalog

1. Sign in with your user.
2. **Navigator > Tools > Reports and Analytics > Browse Catalog**.

### Step 2 – Create the Dashboard

1. Click **Create** → **Dashboard** (under *Analysis and Interactive Reporting*).
2. In the *New Dashboard* dialog:
   - **Name:** `DB_Sulaiman`
   - **Description:** `Payables supplier analyses and BIP reports – Sulaiman`
   - **Location:** **My Folders > Sulaiman**
   - **Content:** *Add content now*
3. Click **OK**.
   ➜ The **Dashboard Builder** opens, and **Page 1** opens by default.

### Step 3 – Rename the first page

1. In the toolbar click **Dashboard Properties** (or the page tab menu) → **Rename** Page 1.
2. New name: `Payables` → **OK**.

### Step 4 – Add (move) the Analyses to the page

1. In the **Catalog** pane (bottom-left), expand **My Folders > Sulaiman**.
2. **Drag** `Analysis_Payables_Supplier` onto the page layout area.
3. **Drag** `Analysis_Supplier_Prompt` below or beside it.
   - To place side by side, drop it on the right edge of the first section (a new column is created), or add a **Column** from *Dashboard Objects* first.
4. (Optional) From *Dashboard Objects* drag a **Text** object to the top and type a title: *Sulaiman – Payables Dashboard*.

### Step 5 – Add the BIP Report

1. From the **Catalog** pane drag `Report_Payables_Supplier` onto the page (new section).
2. Click the section’s **Properties** (⚙) → **Edit** → choose **Display: Embedded content** and the layout → **OK**.

### Step 6 – (Optional) Add a second page for BIP reports

1. Click **Add Dashboard Page** (＋ page icon) → Name: `BIP Reports` → **OK**.
2. Drag `Report_AbsenceMgmt_BU_Sulaiman` and `Report_PAR_LOV_Sulaiman` onto this page.

### Step 7 – Save

1. Click **Save** (top-right of Dashboard Builder).

### Step 8 – Run the Dashboard

1. Click **Run** (top-right).
2. The dashboard opens with the **Payables** page:
   - Supplier analysis table
   - Prompted analysis (choose a Supplier Type → OK)
   - Payables supplier BIP report
3. Click the **BIP Reports** tab to view the second page.

### Step 9 – Export / share (optional)

1. On the running dashboard click the **Page Options (⚙)** menu → **Print** or **Export to Excel / PowerPoint**.
2. To share with another user, use catalog **More > Permissions** (owner gives access) or **Archive** the folder and let the other user **Unarchive** it (Day 33 Security).

---

## 5. Expected result

Dashboard **DB_Sulaiman** opens and shows, on one screen, the supplier analysis, the prompted analysis and the BIP report – organised into pages.

---

## 6. Troubleshooting

| Problem | Fix |
|---------|-----|
| “Dashboard” not in Create menu | User needs BI Author role (via AP Manager). |
| Section shows “No Results” | The analysis itself has no data – check data access (see the *Give Data Access to Your User* task). |
| Changes lost | Always click **Save** in the Dashboard Builder before **Run**. |
| BIP report not displayed | Edit section properties → *Embedded content*; make sure the report has a default layout. |

---

## 7. Completion checklist

- [ ] Dashboard `DB_Sulaiman` created in My Folders > Sulaiman
- [ ] Page renamed to `Payables`
- [ ] Analyses moved onto the page
- [ ] BIP report added
- [ ] (Optional) second page `BIP Reports`
- [ ] Saved and **Run** – all content displays
