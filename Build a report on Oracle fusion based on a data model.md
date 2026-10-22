# Build a Report in Oracle Fusion Using a Data Model

## 1. Log in to Oracle Fusion
1. Log in to **Oracle Fusion**.
2. Go to **Tools → Reports and Analytics → Browse Catalog**.

## 2. Create a Folder
1. Click **New → Folder**.
2. Enter the folder name: `SULAIMAN`.
3. Create the folder.

## 3. Create the Data Model
1. Open the `SULAIMAN` folder.
2. Click **Create → Data Model**.
3. Click the **+** icon and select **SQL Query**.
4. Enter the following settings:
   - **Name:** `SULAIMAN_DM_BU_AbsenceMgmt`
   - **Data Source:** `Oracle BI EE`
   - **Type of SQL:** `Standard SQL`
5. Open **Query Builder**.
6. Select **Payables Invoices – Transactions Real Time**.
7. Click **Invoice Accounting**.
8. Select these columns:
   - `SLA Unrounded Entered Amount Credit`
   - `SLA Unrounded Entered Amount Debit`
   - `Ledger_Currency_Name`
   - `Ledger_Currency`
   - `Invoice_Currency`
   - `Invoice_Currency_Name`
9. Click **Save**, then **OK**.
10. Open the **Data** tab and click **View** to preview the data.
11. Click **Save as Sample Data** and save the data model.

## 4. Create the Report
1. Click **Create → Report**.
2. Choose **Use Data Model**.
3. Browse for and select `SULAIMAN_DM_BU_AbsenceMgmt`.
4. Click **Next**.
5. Choose **Page Header**.
6. Choose **Table** as the report layout.
7. Click **Next**.
8. Drag the required columns into the table.
9. Uncheck **Show Grand Totals Row**.
10. Click **Finish**.

## 5. Save and Run the Report
1. Save the report with this name:

   `SULAIMAN_BU_AbsenceMgmt_report`

2. Click the **PDF** icon in the upper-right corner to run or view the report as a PDF.

## Names Used

| Item | Name |
|---|---|
| Folder | `SULAIMAN` |
| Data Model | `SULAIMAN_DM_BU_AbsenceMgmt` |
| Report | `SULAIMAN_BU_AbsenceMgmt_report` |
