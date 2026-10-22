# Implement Report Bursting

**Student:** Sulaiman
**Module:** Oracle Fusion Cloud – BI Publisher (BIP) Reports
**Source guides:** Day 31 (Bursting Lab), Day 32 (Report Job / Schedule)

---

## 1. Objective

**Bursting** is a BI Publisher feature that splits **one** report into **many** documents based on the data, and delivers each document to the right recipient.

Example: a report contains payments for 3 suppliers. Instead of one report with all 3, bursting creates **one PDF per supplier** and emails each PDF to that supplier.

The three core parts of bursting:

| Part | Meaning |
|------|---------|
| **Split key** (Split By) | The field used to split the data – `SUPPLIER_ID` |
| **Delivery key** (Deliver By) | The field used to match each piece to its delivery row – `SUPPLIER_ID` |
| **Delivery query** | SQL that gives template, format, channel and email details per key |

---

## 2. Lab data

| Supplier ID | Supplier name | Invoice amount | Test recipient |
|-------------|---------------|----------------|----------------|
| 1001 | Gulf Star LLC | 1,250 | supplier1@example.com |
| 1002 | Muscat Office Supplies | 2,400 | supplier2@example.com |
| 1003 | Oman Tech Services | 3,600 | supplier3@example.com |

> Replace the `@example.com` addresses with your own test email (e.g. your Gmail) if you want to actually receive the PDFs.

---

## 3. Objects you will create

| Object | Name |
|--------|------|
| Data Model | `DM_SUPPLIER_BURSTING` |
| Report | `Report_Supplier_Bursting` |
| RTF template | `Report_Supplier_Bursting.rtf` |
| Bursting definition | `XX_SUPPLIER_PAYMENT_BURST` |
| Folder | `My Folders > Sulaiman` |

---

## 4. Login

- Open the Fusion URL given by your instructor.
- Sign in with **your username** and **your password**.

**Navigator > Tools > Reports and Analytics > Browse Catalog**

---

## 5. Steps

### Step 1 – Create the Data Model

1. **Create > Data Model**.
2. **Data Sets > + > SQL Query**.
   - **Name:** `DS_SUPPLIER`
   - **Data Source:** `ApplicationDB_FSCM` (a database source – needed because the query uses `FROM dual`)
   - **Type of SQL:** Standard SQL
3. Paste the query:

```sql
SELECT 1001 AS supplier_id,
       'Gulf Star LLC' AS supplier_name,
       1250 AS invoice_amount
FROM dual
UNION ALL
SELECT 1002,
       'Muscat Office Supplies',
       2400
FROM dual
UNION ALL
SELECT 1003,
       'Oman Tech Services',
       3600
FROM dual
ORDER BY 1
```

> For testing you can first run this query in **SQL Developer** – it returns 3 rows.

4. Click **OK**.
5. **Data** tab → **View** → 3 rows appear → **Save As Sample Data**.
6. **Save** → **My Folders > Sulaiman** → name `DM_SUPPLIER_BURSTING`.

### Step 2 – Create the Report

1. **Create > Report > Use Data Model** → select `DM_SUPPLIER_BURSTING`.
2. **Guide Me** → **Table** → drag `SUPPLIER_ID`, `SUPPLIER_NAME`, `INVOICE_AMOUNT` → **Finish**.
3. Save as `Report_Supplier_Bursting` in **My Folders > Sulaiman**.

### Step 3 – Generate and upload the RTF template

1. Open the report → generate the RTF layout and **download** it (save as `Report_Supplier_Bursting.rtf`).
   - In the report editor this is the **Generate RTF Layout** option (or open the file in MS Word with the BI Publisher add-in using the sample XML).
2. Go to the report → **Edit**.
3. Click **Add New Layout** → **Upload**:
   - **Layout Name:** `Report_Supplier_Bursting`
   - **Template File:** `Report_Supplier_Bursting.rtf`
   - **Type:** RTF Template
   - **Locale:** English (United States)
4. Click **Upload** → **Save**.

> ⚠️ The **layout name** here must be exactly the same as the `TEMPLATE` value in the bursting query (`Report_Supplier_Bursting`).

### Step 4 – Add the bursting definition (belongs to the Data Model)

1. Open `DM_SUPPLIER_BURSTING` → **Edit**.
2. In the left component pane, select **Bursting**.
3. Click **+ (Create New Bursting)** and enter:

| Configuration | Value |
|---------------|-------|
| Bursting name | `XX_SUPPLIER_PAYMENT_BURST` |
| Type | SQL Query |
| Data Source | `ApplicationDB_FSCM` |
| Split By | `SUPPLIER_ID` (e.g. `/DATA_DS/G_1/SUPPLIER_ID`) |
| Deliver By | `SUPPLIER_ID` (e.g. `/DATA_DS/G_1/SUPPLIER_ID`) |
| Template | `Report_Supplier_Bursting` |
| Template format | RTF |
| Output format | PDF |
| Delivery channel | EMAIL |

4. In the **SQL Query** box enter the delivery query:

```sql
SELECT
  '1001'                                       KEY,
  'Report_Supplier_Bursting'                   TEMPLATE,
  'RTF'                                        TEMPLATE_FORMAT,
  'en-US'                                      LOCALE,
  'PDF'                                        OUTPUT_FORMAT,
  'EMAIL'                                      DEL_CHANNEL,
  'supplier1@example.com'                      PARAMETER1,
  NULL                                         PARAMETER2,
  NULL                                         PARAMETER3,
  'Supplier Payment Advice - Gulf Star LLC'    PARAMETER4,
  'Please find your payment advice attached.'  PARAMETER5,
  'true'                                       PARAMETER6,
  'noreply@example.com'                        PARAMETER7
FROM dual
UNION ALL
SELECT
  '1002',
  'Report_Supplier_Bursting',
  'RTF',
  'en-US',
  'PDF',
  'EMAIL',
  'supplier2@example.com',
  NULL,
  NULL,
  'Supplier Payment Advice - Muscat Office Supplies',
  'Please find your payment advice attached.',
  'true',
  'noreply@example.com'
FROM dual
UNION ALL
SELECT
  '1003',
  'Report_Supplier_Bursting',
  'RTF',
  'en-US',
  'PDF',
  'EMAIL',
  'supplier3@example.com',
  NULL,
  NULL,
  'Supplier Payment Advice - Oman Tech Services',
  'Please find your payment advice attached.',
  'true',
  'noreply@example.com'
FROM dual
```

5. Click **Save** (data model).

#### What each column of the delivery query means (EMAIL channel)

| Column | Meaning |
|--------|---------|
| KEY | Must match the Deliver By value (`SUPPLIER_ID`) |
| TEMPLATE | Layout name in the report |
| TEMPLATE_FORMAT | RTF |
| LOCALE | en-US |
| OUTPUT_FORMAT | PDF |
| DEL_CHANNEL | EMAIL |
| PARAMETER1 | To (email address) |
| PARAMETER2 | Cc |
| PARAMETER3 | From |
| PARAMETER4 | Subject |
| PARAMETER5 | Message body |
| PARAMETER6 | Attachment (`true`) |
| PARAMETER7 | Reply-To |

### Step 5 – Enable bursting on the report

1. Open `Report_Supplier_Bursting` → **Edit** → **Properties** (top-right).
2. On the **General** tab tick **Enable Bursting** and select `XX_SUPPLIER_PAYMENT_BURST`.
3. **OK** → **Save**.

### Step 6 – Schedule the report (Report Job)

> Clicking **View Report** does **not** burst. Bursting runs only through a **scheduled job**.

1. **Create > Report Job** (or open the report → **Schedule**).
2. **General:** browse to `Report_Supplier_Bursting`.
3. **Schedule:** Frequency = **Once**, Start = **Right now**.
4. **Delivery:** confirm **Use Bursting Definition to Determine Delivery Information** is ticked (Email).
5. **Notification:** tick email notification and enter your email (optional).
6. Click **Submit** → give the job a name, e.g. `Sulaiman_Supplier_Burst_Job` → **OK**.

### Step 7 – Check the result

1. Go to **Open > Report Job History**.
2. Find `Sulaiman_Supplier_Burst_Job` → Status should be **Success**.
3. Open the job → you will see **3 outputs** (one PDF per supplier) and the delivery status of each email.

---

## 6. Expected result

- One PDF for **Gulf Star LLC**, one for **Muscat Office Supplies**, one for **Oman Tech Services**.
- Each PDF is sent to its own email address with its own subject line.

---

## 7. Troubleshooting

| Problem | Fix |
|---------|-----|
| Only one PDF produced | Split By is wrong – it must be `SUPPLIER_ID`. |
| “Template not found” | `TEMPLATE` value ≠ layout name in the report. Make them identical. |
| Job succeeds but no email | Demo environments often block outgoing mail; the email server must be configured by the organization. Check delivery status in Job History. |
| `FROM dual` error | Data source must be a DB source (`ApplicationDB_FSCM`), not OBIEE. |
| Nothing happens in View Report | Normal – bursting only runs through **Schedule / Report Job**. |

---

## 8. Completion checklist

- [ ] Data model `DM_SUPPLIER_BURSTING` created with 3 rows
- [ ] Report `Report_Supplier_Bursting` created
- [ ] RTF template generated and uploaded with the same name
- [ ] Bursting definition `XX_SUPPLIER_PAYMENT_BURST` added (Split By / Deliver By = SUPPLIER_ID)
- [ ] Enable Bursting ticked in report properties
- [ ] Report job scheduled (Once – Right now)
- [ ] 3 separate PDF outputs seen in Report Job History
