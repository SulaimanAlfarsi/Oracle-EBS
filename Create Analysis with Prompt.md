# Create an Analysis with a Prompt

**Student:** Sulaiman
**Module:** Oracle Fusion Cloud – OTBI
**Source guides:** Day 32 / Day 33 (OTBI Analysis). The prompt steps below follow the standard OTBI analysis editor (*Criteria / Results / Prompts* tabs).

---

## 1. Objective

A **prompt** in OTBI is like a **parameter** in BIP: it asks the user for a value **before** the results show, and the analysis is filtered by that value.

You will add a prompt on **Supplier Type** to the supplier analysis.

---

## 2. Prerequisites

- Your user with Accounts Payable Manager role and data access (see the *Give Data Access to Your User* task).
- *Create Analysis Payables Supplier Details* task completed (you know the Supplier columns).

---

## 3. Objects you will create

| Object | Name |
|--------|------|
| Analysis | `Analysis_Supplier_Prompt` |
| Prompt column | `Supplier Type` |
| Folder | `My Folders > Sulaiman` |

---

## 4. Steps

### Step 1 – Create the analysis

1. Sign in with your user → **Navigator > Tools > Reports and Analytics > Browse Catalog**.
2. **Create > Analysis** → Subject Area **Payables Invoices – Transactions Real Time**.
3. From the **Supplier** folder add:
   - Supplier Number
   - Supplier
   - Supplier Type
4. From **Invoices** add:
   - Invoice Amount
   - Invoice Currency

### Step 2 – Add an “is prompted” filter

1. In **Selected Columns**, click ⚙ on **Supplier Type** → **Filter**.
2. In the *New Filter* dialog set **Operator** = **is prompted**.
3. Click **OK**.
   The filter **Supplier Type is prompted** now appears in the **Filters** pane.

> “is prompted” means: *take the value from the prompt*.

### Step 3 – Create the Column Prompt

1. Click the **Prompts** tab (top of the editor).
2. In **Definition**, click **+ (New)** → **Column Prompt**.
3. Select the column **Supplier Type** → **OK**.
4. In the *New Prompt* dialog set:
   - **Label:** `Select Supplier Type`
   - **Operator:** is equal to / is in
   - **User Input:** **Choice List**
   - **Choice List Values:** All Column Values
   - (Optional) **Default selection:** leave blank
5. Click **OK**.

> Add a second prompt the same way if you like, e.g. **Invoice Currency** (Choice List).

### Step 4 – Preview the prompt

1. On the **Prompts** tab, click **Preview** (eye icon).
2. The drop-down **Select Supplier Type** appears with all supplier types.

### Step 5 – Save the analysis

1. Click **Save Analysis**.
2. Location: **My Folders > Sulaiman** → Name: `Analysis_Supplier_Prompt` → **OK**.

### Step 6 – Run the analysis with the prompt

1. **Catalog > My Folders > Sulaiman > Analysis_Supplier_Prompt > Open**.
2. The prompt page appears first.
3. Choose a Supplier Type (e.g. *Supplier* or *Employee*) → click **OK**.
4. The results show **only suppliers of that type**.
5. Change the value and click **OK** again – the results refresh.

---

## 5. Expected result

| Action | Result |
|--------|--------|
| Open analysis | Prompt “Select Supplier Type” displayed |
| Choose value → OK | Table filtered to that Supplier Type |

---

## 6. Troubleshooting

| Problem | Fix |
|---------|-----|
| Prompt shows but results not filtered | The filter **Supplier Type is prompted** is missing in the Criteria tab. |
| Choice list empty | User lacks data access – see *Give Data Access to Your User* task. |
| No prompt when opening | Make sure the prompt was saved on the **Prompts** tab before saving the analysis. |

---

## 7. Completion checklist

- [ ] Analysis created with supplier & invoice columns
- [ ] Filter *Supplier Type is prompted* added
- [ ] Column prompt on Supplier Type (Choice List) created
- [ ] Saved as `Analysis_Supplier_Prompt`
- [ ] Opened, value selected, filtered result shown
