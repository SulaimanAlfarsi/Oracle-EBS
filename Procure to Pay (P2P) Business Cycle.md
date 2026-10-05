# Oracle EBS – Procure to Pay (P2P) Business Cycle

## 1. Business Cycles in Oracle Apps

There are two main business cycles:

### P2P – Procure to Pay

**Business to Business (B2B)**

```text
Procurement → Purchasing → Receiving → Payables → General Ledger
```

P2P is mainly related to:

* **AP – Accounts Payables**
* **Purchasing**
* **Inventory**
* **GL – General Ledger**

### O2C – Order to Cash

**Business to Consumer (B2C)**

```text
Customer Order → Shipping → Receivables → Payment → General Ledger
```

O2C is mainly related to:

* **AR – Accounts Receivables**
* **Order Management**
* **Shipping**
* **GL – General Ledger**

---

# 2. P2P – Procure to Pay

## Business Flow

The complete P2P cycle is:

```text
Requisition
     ↓
Approval
     ↓
RFQ
     ↓
Quotation
     ↓
Purchase Order (PO)
     ↓
PO Approval
     ↓
Receipt
     ↓
Supplier Invoice
     ↓
Invoice Validation
     ↓
Payment
     ↓
Accounting
     ↓
General Ledger
```

---

# 3. Applications / Functional Modules Used in P2P

The P2P cycle uses the following Oracle EBS modules:

1. **Inventory (INV)**
2. **Purchasing**
3. **Accounts Payables (AP)**
4. **General Ledger (GL)**

---

# 4. Inventory – Vision Operations (USA)

## Responsibility

```text
Inventory, Vision Operations (USA)
```

Main activities:

1. Master Items
2. Item Transactions
3. Miscellaneous Receipts
4. On-Hand Quantity

---

# 5. Step 1 – Create Item

## Navigation

```text
Inventory, Vision Operations (USA)
    ↓
Items
    ↓
Master Items
```

## Enter Item Information

### Organization

```text
V1 Vision Operations
```

### Item

Use the SULAIMAN naming convention:

```text
XX_SULAIMAN_LAPTOP
```

### Description

```text
Laptop for SULAIMAN Training
```

> `XX_` is used as part of the EBS training naming convention.

---

## Copy Item Information

Go to:

```text
Tools
    ↓
Copy From
```

Select:

```text
Finished
```

Then:

```text
TAB
    ↓
Apply
    ↓
Done
```

Make sure the required checkboxes are selected.

---

## Purchasing Tab

Go to:

```text
Purchasing
```

Enter:

```text
List Price: 100
```

Then:

```text
Save
```

---

## Check Item in Database

Table:

```text
MTL_SYSTEM_ITEMS_B
```

SQL:

```sql
SELECT *
FROM mtl_system_items_b
WHERE segment1 = 'SULAIMAN_LAPTOP';
```

> `MTL_SYSTEM_ITEMS_B` contains the item master information.

---

# 6. Step 2 – Add Items to Stock

We will add **1000 laptops** into inventory.

## Navigation

```text
Inventory, Vision Operations (USA)
    ↓
Transactions
    ↓
Miscellaneous Transactions
```

## Transaction Type

Select:

```text
Miscellaneous Receipt
```

## Transaction Lines

Enter:

```text
Item: XX_SULAIMAN_LAPTOP
Subinventory: Stores
UOM: Ea
Quantity: 1000
```

Enter the required account.

Then:

```text
Save
```

---

# 7. Step 3 – Check On-Hand Quantity

## Navigation

```text
Inventory, Vision Operations (USA)
    ↓
On-Hand Availability
    ↓
On-hand Quantity
```

Enter:

```text
Item: SULAIMAN_LAPTOP
```

Press:

```text
TAB
```

The description should appear automatically.

Click:

```text
Find
```

Then click:

```text
Availability
```

Expected result:

```text
Quantity on Hand = 1000
```

---

# 8. Inventory Database Check

```sql
SELECT *
FROM mtl_system_items_b
WHERE segment1 = 'SULAIMAN_LAPTOP';
```

At this point:

```text
Inventory Completed
```

We now have:

```text
SULAIMAN_LAPTOP
Quantity = 1000
```

---

# 9. Step 4 – Create Requisition

## Responsibility

```text
Purchasing, Vision Operations (USA)
```

## Navigation

```text
Purchasing
    ↓
Requisitions
    ↓
Requisitions
```

A requisition contains three main sections:

1. Header Information
2. Line Information
3. Distribution Information

---

## Requisition Line

Enter:

```text
Item: SULAIMAN_LAPTOP
Quantity: 25
Need By Date: 25-Oct-23
Location: Auckland
Supplier: Abbott Laboratories
Site: CORP HQ
```

Go to:

```text
Distributions
```

Enter/check the required distribution information.

Then:

```text
Save
```

Example:

```text
Requisition Number: 14394
```

---

# 10. Requisition Database Tables

## Requisition Header

```sql
SELECT *
FROM po_requisition_headers_all
WHERE segment1 = '14394';
```

## Requisition Lines

```sql
SELECT *
FROM po_requisition_lines_all
WHERE requisition_header_id = '202180';
```

## Requisition Distribution

```sql
SELECT *
FROM po_req_distributions_all
WHERE requisition_line_id = '229388';
```

### Important

A requisition is divided into:

```text
Header
   ↓
Lines
   ↓
Distributions
```

---

# 11. Step 5 – Create RFQ

RFQ means:

**Request for Quotation**

The organization asks suppliers to provide their prices.

## Navigation

```text
Purchasing, Vision Operations (USA)
    ↓
RFQ
```

Enter:

```text
Type: Standard RFQ
Bill To: Auckland
Close Date: 25-May-22
```

## Item

```text
Item: SULAIMAN_LAPTOP
```

Go to:

```text
Price Breaks
```

Enter/check the required information.

## Organization / Shipping

```text
Org: V1
Ship To: Auckland
```

## Supplier

Click:

```text
Suppliers
```

Enter:

```text
Supplier: Abbott Laboratories
```

Then:

```text
Save
```

Example:

```text
RFQ Number: 313
```

---

# 12. RFQ Database Checks

## RFQ Header

```sql
SELECT *
FROM po_headers_all
WHERE segment1 = '313';
```

## RFQ Header with Type

```sql
SELECT *
FROM po_headers_all
WHERE segment1 = '313'
AND type_lookup_code = 'RFQ';
```

## RFQ Lines

```sql
SELECT *
FROM po_lines_all
WHERE po_header_id = '126313';
```

## RFQ Suppliers

```sql
SELECT *
FROM po_rfq_vendors
WHERE po_header_id = '126313';
```

Expected:

```text
1 row selected
```

This means one supplier was selected.

---

# 13. Step 6 – Create Quotation from RFQ

From the RFQ window:

```text
Tools
    ↓
Copy Document
```

Select:

```text
Action: Entire RFQ
Type: Standard Quotation
Supplier: Abbott Laboratories
Site: CORP HQ
```

Click:

```text
OK
```

Example:

```text
Quotation Number: 506
Status: Active
```

---

## Approve Quotation

Go to:

```text
Price Breaks
    ↓
Approve
```

Enter:

```text
Type: All Order
Reason: Quality
```

Click:

```text
OK
```

Expected message:

```text
Quotation lines approved!!!
```

---

# 14. Quotation Database Checks

## Quotation Header

```sql
SELECT *
FROM po_headers_all
WHERE segment1 = '506'
AND type_lookup_code = 'QUOTATION';
```

## Quotation Lines

```sql
SELECT *
FROM po_lines_all
WHERE po_header_id = '126320';
```

---

# 15. Step 7 – Create Purchase Order

## Navigation

```text
Purchasing, Vision Operations (USA)
    ↓
Purchase Orders
    ↓
Purchase Order
```

Enter:

```text
Bill To: Auckland
```

Click:

```text
Num
```

Enter/select:

```text
Item: SULAIMAN_LAPTOP
Quantity: 25
Need By Date: 25-May-22
```

---

# 16. PO Shipments

Click:

```text
Shipments
```

Enter:

```text
Org: V1
Ship To: Auckland
Quantity: 25
```

---

# 17. PO Distributions

Click:

```text
Distributions
```

Check:

* Charge Account
* Amount
* Currency
* Distribution Status

Then:

```text
Save
```

Example:

```text
PO Number: 6156
Supplier: Abbott Laboratories
Site: CORP HQ
```

Then click:

```text
Approve
```

Expected status:

```text
APPROVED
```

---

# 18. Purchase Order Summary

## Navigation

```text
Purchase Orders
    ↓
Purchase Order Summary
```

Enter:

```text
Number: 6156
```

Click:

```text
Find
```

---

# 19. PO Database Checks

## PO Header

```sql
SELECT *
FROM po_headers_all
WHERE segment1 = '6156';
```

## PO Lines

```sql
SELECT *
FROM po_lines_all
WHERE po_header_id = '<PO_HEADER_ID>';
```

## PO Shipments

```sql
SELECT *
FROM po_line_locations_all
WHERE po_line_id = '<PO_LINE_ID>';
```

---

# 20. Important PO Structure

A Purchase Order contains:

### Header

Contains information such as:

* Approval Status
* Supplier
* Supplier Site
* PO Number

### Lines

Contains:

* Item
* Price
* Quantity
* Amount

### Shipments

Contains:

* Ship To Location
* Quantity
* Amount
* Organization

### Distributions

Contains:

* Charge Account
* Amount
* Currency
* Status

---

# 21. Step 8 – Receive the Product

## Navigation

```text
Purchasing, Vision Operations (USA)
    ↓
Receiving
    ↓
Receipts
```

Enter:

```text
Organization: V1 Vision Operations
Purchase Order: 6156
```

Supplier should appear automatically:

```text
Supplier: Abbott Laboratories
```

Comments:

```text
Receipt for PO 6156 - Laptop
```

Then:

```text
Save
```

Example:

```text
Receipt Number: 8508
```

---

# 22. Receipt Database Checks

## All Recent Receipts

```sql
SELECT *
FROM rcv_shipment_headers
ORDER BY 1 DESC;
```

## Specific Receipt

```sql
SELECT *
FROM rcv_shipment_headers
WHERE receipt_num = '8508';
```

---

# 23. Step 9 – Create Supplier Invoice

## Responsibility

```text
Payables, Vision Operations (USA)
```

## Navigation

```text
Invoices
    ↓
Entry
    ↓
Invoices
```

Enter:

```text
PO Number: 6156
```

Press:

```text
TAB
```

The relevant PO information should be displayed.

---

## Invoice Information

Enter:

```text
Invoice Date: 23-Oct-23
Invoice Number: SULAIMANINV001
Invoice Amount: 2500
```

Calculation:

```text
25 laptops × $100
= $2500
```

---

# 24. Invoice Lines

Go to:

```text
Lines
```

Enter/check:

```text
Amount: 2500
Ship To: Auckland
PO Line: Select from LOV
PO Shipment: Select from LOV
```

Then:

```text
Distributions
```

Check the distribution information.

Then:

```text
Save
```

---

# 25. Validate Invoice

Go to:

```text
Actions
    ↓
Validate
    ↓
OK
```

If there are holds:

```text
Holds
    ↓
Release
```

Select the required release name.

Click:

```text
OK
```

---

# 26. Check Invoice Status

Go to:

```text
General
```

Expected:

```text
Status: Validated
```

---

# 27. Create Accounting for Invoice

Go to:

```text
Actions
    ↓
Create Accounting
    ↓
Final Post
    ↓
Force Approval
    ↓
OK
```

Expected message:

```text
Accounting has been successfully created for this Transaction!!!
```

---

# 28. Invoice Database Checks

## Invoice Header

```sql
SELECT *
FROM ap_invoices_all
WHERE invoice_num = 'SULAIMANINV001';
```

## Invoice Lines

```sql
SELECT *
FROM ap_invoice_lines_all
WHERE invoice_id = '<INVOICE_ID>';
```

## Invoice Distributions

```sql
SELECT *
FROM ap_invoice_distributions_all
WHERE invoice_id = '<INVOICE_ID>'
AND invoice_line_number = '<LINE_NUMBER>';
```

---

# 29. Find Accounting Event ID

```sql
SELECT accounting_event_id
FROM ap_invoice_distributions_all
WHERE invoice_id = '<INVOICE_ID>';
```

Example:

```text
Accounting Event ID = 3345716
```

This ID can then be used to check SLA information.

---

# 30. Step 10 – Make Payment

## Navigation

```text
Payables, Vision Operations (USA)
    ↓
Payments
    ↓
Entry
    ↓
Payments
```

Enter:

```text
Type: Manual
Operating Unit: Vision Operations
Supplier: Abbott Laboratories
```

Press:

```text
TAB
```

Enter:

```text
Payment Date: 25-Oct-23
Bank Account: BofA 204
Payment Process Profile: CHECK - USD
```

Click the invoice selection area.

Select:

```text
Invoice: SULAIMANINV001
```

Then:

```text
Save
```

---

# 31. Create Accounting for Payment

Go to:

```text
Actions
    ↓
Create Accounting
    ↓
Final Post
    ↓
OK
```

Expected:

```text
Accounting: PROCESSED
```

This means the payment accounting has been completed.

---

# 32. Payment Database Check

```sql
SELECT *
FROM ap_invoice_payments_all
WHERE invoice_id = '<INVOICE_ID>'
ORDER BY 1 DESC;
```

---

# 33. Step 11 – General Ledger

After the AP transaction is accounted, the accounting information flows to:

```text
General Ledger
```

## Check GL Journal Header

```sql
DESC gl_je_headers;
```

Then:

```sql
SELECT *
FROM gl_je_headers
ORDER BY 1 DESC;
```

Example journal:

```text
Name: Oct-23 Purchase Invoices USD
```

---

# 34. Review Journal in GL

## Navigation

```text
General Ledger, Vision Operations (USA)
    ↓
Journals
    ↓
Enter
```

Enter:

```text
Journal: Oct-23 Purchase Invoices USD
```

Click:

```text
Find
```

Then select the journal and:

```text
Review Journal
```

You should see the accounting amounts.

Example:

```text
Debit  = 2500
Credit = 2500
```

The journal should be balanced.

---

# 35. SLA – Subledger Accounting

SLA means:

**Subledger Accounting**

SLA connects transactions from subledgers such as AP to General Ledger.

Main SLA tables:

```text
XLA_EVENTS
XLA_AE_HEADERS
XLA_AE_LINES
XLA_DISTRIBUTION_LINKS
```

---

# 36. Check SLA Event

Use the Accounting Event ID:

```sql
SELECT *
FROM xla_events
WHERE event_id = '3345716';
```

---

# 37. Check SLA Accounting Header

```sql
SELECT *
FROM xla_ae_headers
WHERE event_id = '3345716';
```

---

# 38. Check SLA Accounting Lines

First get the `AE_HEADER_ID`, then:

```sql
SELECT *
FROM xla_ae_lines
WHERE ae_header_id = '<AE_HEADER_ID>';
```

---

# 39. Check SLA Distribution Links

```sql
SELECT *
FROM xla_distribution_links
WHERE ae_header_id = '<AE_HEADER_ID>'
AND ae_line_num IN (1,2);
```

---

# 40. Complete P2P Cycle

The complete SULAIMAN P2P lab is:

```text
1. Create Item
       ↓
2. Add Item to Inventory
       ↓
3. Check On-Hand Quantity
       ↓
4. Create Requisition
       ↓
5. Approve Requisition
       ↓
6. Create RFQ
       ↓
7. Select Supplier
       ↓
8. Create Quotation
       ↓
9. Approve Quotation
       ↓
10. Create Purchase Order
       ↓
11. Approve PO
       ↓
12. Receive Product
       ↓
13. Create AP Invoice
       ↓
14. Validate Invoice
       ↓
15. Create Accounting
       ↓
16. Make Payment
       ↓
17. Create Payment Accounting
       ↓
18. Review GL Journal
       ↓
19. Check SLA Tables
```

---

# 41. Important Naming Convention

For this SULAIMAN training lab, use:

```text
XX_SULAIMAN_LAPTOP
```

Instead of:

```text
XX_ANIL_LAPTOP
```

For the invoice:

```text
SULAIMANINV001
```

For procedures and custom objects, use:

```text
SULAIMAN_...
```

Example:

```text
SULAIMAN_PR_CURSOR
SULAIMAN_PR_REPORT
SULAIMAN_TEST
```

---

# 42. Main EBS Responsibilities

| Responsibility                          | Main Purpose                                |
| --------------------------------------- | ------------------------------------------- |
| Inventory, Vision Operations (USA)      | Items and Inventory                         |
| Purchasing, Vision Operations (USA)     | Requisitions, RFQ, Quotations, PO, Receipts |
| Payables, Vision Operations (USA)       | Invoices and Payments                       |
| General Ledger, Vision Operations (USA) | Journals and Accounting                     |

---

# 43. Main Tables to Remember

## Inventory

```text
MTL_SYSTEM_ITEMS_B
```

## Purchasing

```text
PO_REQUISITION_HEADERS_ALL
PO_REQUISITION_LINES_ALL
PO_REQ_DISTRIBUTIONS_ALL
PO_HEADERS_ALL
PO_LINES_ALL
PO_LINE_LOCATIONS_ALL
PO_RFQ_VENDORS
```

## Receiving

```text
RCV_SHIPMENT_HEADERS
```

## Payables

```text
AP_INVOICES_ALL
AP_INVOICE_LINES_ALL
AP_INVOICE_DISTRIBUTIONS_ALL
AP_INVOICE_PAYMENTS_ALL
```

## SLA

```text
XLA_EVENTS
XLA_AE_HEADERS
XLA_AE_LINES
XLA_DISTRIBUTION_LINKS
```

## General Ledger

```text
GL_JE_HEADERS
```

---

# 44. Final P2P Summary

The purpose of P2P is to manage the complete process of purchasing goods or services and paying the supplier.

```text
Need Something
      ↓
Requisition
      ↓
Ask Suppliers for Price
      ↓
RFQ
      ↓
Supplier Quotation
      ↓
Purchase Order
      ↓
Supplier Delivers
      ↓
Receipt
      ↓
Supplier Sends Invoice
      ↓
AP Validates Invoice
      ↓
Payment
      ↓
SLA Accounting
      ↓
General Ledger
```

### Simple Explanation

```text
Requisition = We need something.

RFQ = Ask suppliers for their price.

Quotation = Supplier gives the price.

PO = We officially order the item.

Receipt = We received the item.

Invoice = Supplier asks for payment.

AP = We validate and pay the invoice.

SLA = Oracle creates subledger accounting.

GL = Final accounting information goes to General Ledger.
```

**End of P2P Cycle: Inventory → Purchasing → Receiving → AP → Payment → SLA → GL**
