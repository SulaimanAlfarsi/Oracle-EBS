# Create a BIP Report with a Parameter and LOV

**Student:** Sulaiman
**Module:** Oracle Fusion Cloud – BI Publisher (BIP) Reports
**Source guide:** Day 29 – LAB 2 (Create DM along with Parameter and LOV, then create Report)

---

## 1. Objective

Instead of typing the filter value, the user picks it from a **drop-down list (LOV – List of Values)**.

Order of work:

1. Data Model
2. Parameter
3. LOV
4. Attach LOV to Parameter
5. Report

---

## 2. Objects you will create

| Object | Name |
|--------|------|
| Data Model | `DM_PAR_LOV_Sulaiman` |
| Parameter | `LOC_NAME` |
| List of Values | `LOV_LOC_NAME` |
| Report | `Report_PAR_LOV_Sulaiman` |
| Folder | `My Folders > Sulaiman` |

---

## 3. Login

- Open the Fusion URL given by your instructor.
- Sign in with **your username** and **your password**.

Then: **Navigator > Tools > Reports and Analytics > Browse Catalog**.

---

## 4. Steps

### Step 1 – Create the Data Model with the parameter

1. Click **Create > Data Model** (Published Reporting – yellow icon).
2. **Data Sets > + > SQL Query**.
   - **Name:** `DS_DEPT`
   - **Data Source:** `OBIEE`
3. Click **Query Builder** → Subject Area **Absence Management – Availability Patterns Real Time**.
4. Expand **Department** and tick:
   - Department Name
   - Department Address
   - Location Code
   - Location Name
5. Add the condition `= :LOC_NAME` on **Location Name**. Final SQL:

```sql
select "Department"."Department Name"    as "Department Name",
       "Department"."Department Address" as "Department Address",
       "Department"."Location Code"      as "Location Code",
       "Department"."Location Name"      as "Location Name"
from   "Absence Management - Availability Patterns Real Time"."Department" "Department"
where  "Department"."Location Name" = :LOC_NAME
```

6. Click **OK** → accept the prompt to create the bind parameter.
   ✅ The parameter **LOC_NAME** is created automatically.
7. Click **Save** → **My Folders > Sulaiman** → name `DM_PAR_LOV_Sulaiman`.

### Step 2 – Create the LOV

1. In the left pane of the data model, click **List of Values**.
2. Click **+ (Create new List of Values)**.
3. Fill in:
   - **Name:** `LOV_LOC_NAME`
   - **Type:** SQL Query
   - **Data Source:** `OBIEE`
4. Click **Query Builder** → same subject area → **Department** → tick only **Location Name**.
   The query must be:

```sql
select "Department"."Location Name" as "Location Name"
from   "Absence Management - Availability Patterns Real Time"."Department" "Department"
```

5. Click **Save** (data model).

> Tip: an LOV query returns **one column** (value) or **two columns** (display text, value).
> For Lab 1 (Business Unit) the LOV query used two columns:
>
> ```sql
> select "Business Unit"."Business Unit Id"   as "Business Unit Id",
>        "Business Unit"."Business Unit Name" as "Business Unit Name"
> from "Absence Management - Availability Patterns Real Time"."Business Unit" "Business Unit"
> ```

### Step 3 – Attach the LOV to the parameter

1. In the left pane click **Parameters > LOC_NAME**.
2. Set:
   - **Data Type:** String
   - **Parameter Type:** **Menu**
   - **Display Label:** `Location Name`
   - **List of Values:** `LOV_LOC_NAME`
3. Click **Save**.

### Step 4 – Test the data model

1. Click the **Data** tab.
2. The **LOC_NAME** parameter now shows a **drop-down list**.
3. Select a location → click **View** → rows appear.
4. Click **Save As Sample Data**.
5. Click **Save**.

### Step 5 – Create the Report

1. Click **Create > Report**.
2. **Use Data Model** → browse to **My Folders > Sulaiman > DM_PAR_LOV_Sulaiman.xdm** → **OK**.
3. Choose **Guide Me** → layout style **Table & Chart** → **Next**.
4. Drag the columns into the table; drag *Location Name* / *Department Name* into the chart → **Next**.
5. Select **Run Report** → **Finish**.
6. Save as `Report_PAR_LOV_Sulaiman` in **My Folders > Sulaiman**.

### Step 6 – View the Report

1. **Catalog > My Folders > Sulaiman > Report_PAR_LOV_Sulaiman > Open**.
2. The **Location Name** parameter is shown as a drop-down list (the LOV).
3. Select a location → **Apply**.

---

## 5. Expected result

- The parameter is displayed as a **list** (not a text box).
- After choosing a value and clicking **Apply**, the table and chart show only the departments of that location.

---

## 6. Troubleshooting

| Problem | Fix |
|---------|-----|
| LOV list is empty | Open the LOV and test its query; make sure the data source is `OBIEE`. |
| Parameter still a text box | Parameter Type must be **Menu** and the LOV must be selected. |
| Report shows old parameter | Re-save sample data and the data model, then reopen the report. |

---

## 7. Completion checklist

- [ ] Data model `DM_PAR_LOV_Sulaiman` with `:LOC_NAME`
- [ ] LOV `LOV_LOC_NAME` created
- [ ] Parameter type = Menu, LOV attached
- [ ] Sample data saved
- [ ] Report created (Table & Chart)
- [ ] Report opened, value picked from the list and filtered output shown
