Steps
Login to EBS.

Create an Executable:
Application Developer → Concurrent → Executable

Executable: SULAIMAN_PR_FAC
Short Name: SULAIMAN_PR_FAC
Application: AOL
Execution Method: PL/SQL Stored Procedure
Execution File Name: SULAIMAN_PR_FAC

Click Save.

Create a Concurrent Program:
Application Developer → Concurrent → Program

Program: SULAIMAN_PR_FAC_PG
Short Name: SULAIMAN_PR_FAC_PG
Application: AOL
Executable Name: SULAIMAN_PR_FAC
Format: HTML
Style: A4

Click Save.

Click Parameters and enter:

Seq: 1
Parameter: N
Value Set: NUMBER_15

Click Save.

Add the program to the existing Request Group.

Go to:
System Administrator → Security → Responsibility → Request

Search for:

Group: SULAIMAN_PR_FAC_PG

Add:

Program: SULAIMAN_PR_FAC_PG

Click Save.

Switch to your Responsibility and create a new Request.

Select:

SULAIMAN_PR_FAC_PG
Enter a value for N.
Submit the request and view the Output.