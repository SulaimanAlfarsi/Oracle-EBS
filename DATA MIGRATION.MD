# DATA MIGRATION

## Moving Legacy Data to the New Oracle EBS Implementation

### What is Data Migration?

**Data Migration** means moving data from an **old/legacy system** to a **new Oracle EBS system**.

Oracle provides a utility called **SQL*Loader** to help load data into Oracle tables.

---

# SQL*LOADER

**SQL*Loader** is an Oracle tool used to load data from an external data file into an Oracle database table.

The main parts are:

1. **Control File**
2. **Data File**
3. **Log File**
4. **Discard File**
5. **Bad File**

---

# CONTROL FILE

The **Control File** is the main file used by SQL*Loader.

It tells SQL*Loader:

* Where the data file is
* Which table to load
* How the data is separated
* Which columns receive the data

### Example

```text
LOAD DATA
INFILE '/u01/install/VISION/fs1/EBSapps/appl/fnd/12.0.0/reports/US/SULAIMANDATA.dat'
INTO TABLE SULAIMAN_TEST
FIELDS TERMINATED BY ","
OPTIONALLY ENCLOSED BY '"'
(ID, NAME, COURSE)
```

---

# SQL*LOADER FILES

## 1. LOG FILE

The **LOG file** contains information about the SQL*Loader process.

It records:

* Number of records loaded
* Number of records rejected
* Errors
* Loading information

---

## 2. DISCARD FILE

The **DISCARD file** contains records that do not match the selection criteria in the control file.

These records are not loaded into the database.

---

## 3. BAD FILE

The **BAD file** contains records that cause errors during loading.

For example:

* Invalid data type
* Invalid number
* Incorrect data format

---

# TWO TYPES OF INTERFACES

## 1. INBOUND INTERFACE

An **Inbound Interface** moves data **into the EBS system**.

```text
Local Machine
     |
     | Data
     ↓
New Oracle EBS System
```

### Example

**SQL*Loader**

SQL*Loader can take legacy data from a file and load it into an Oracle EBS database table.

---

## 2. OUTBOUND INTERFACE

An **Outbound Interface** moves data **outside of the EBS system**.

```text
Oracle EBS System
     |
     | Data
     ↓
Local Machine
```

### Example

**UTL_FILE Package**

`UTL_FILE` can be used in PL/SQL to write data from Oracle into an external file.

---

# SUPPORTED INTERFACES

Oracle EBS supports different interfaces for moving data.

### 1. Table-Based Open Interfaces

Used to load data into interface tables and then process it into EBS.

### 2. PL/SQL Object APIs

Used to insert or update EBS data using Oracle-provided APIs.

### 3. ADI / WebADI

Used to transfer data between Excel and Oracle EBS.

### 4. FNDLOAD

Used mainly for moving **Oracle Applications / AOL setup data** between environments.

---

# LAB

## OSI – OPEN SYSTEM INTERFACE

### Tool: SQL*Loader

For this lab, we will use **SQL*Loader** to move legacy data into an Oracle database table.

---

# LAB STEPS

We need:

1. **Control File**
2. **Data File**
3. **Database Table**
4. **SQL*Loader**
5. **Log File**
6. **Discard File**
7. **Bad File**

---

# 1. CREATE CONTROL FILE

Open **Notepad** and create:

```text
SULAIMANCONTROL.ctl
```

Put the following inside:

```text
LOAD DATA
INFILE '/u01/install/VISION/fs1/EBSapps/appl/fnd/12.0.0/reports/US/SULAIMANDATA.dat'
INTO TABLE SULAIMAN_TEST
FIELDS TERMINATED BY ","
OPTIONALLY ENCLOSED BY '"'
(ID, NAME, COURSE)
```

### Explanation

```text
LOAD DATA
```

Starts the SQL*Loader process.

```text
INFILE
```

Specifies the location of the data file.

```text
INTO TABLE SULAIMAN_TEST
```

Specifies the database table where the data will be loaded.

```text
FIELDS TERMINATED BY ","
```

Means the fields are separated by a comma.

```text
OPTIONALLY ENCLOSED BY '"'
```

Means the values can be enclosed with double quotes.

```text
(ID, NAME, COURSE)
```

Specifies the columns that receive the data.

---

# 2. CREATE DATA FILE

Open another **Notepad** file.

Save it as:

```text
SULAIMANDATA.dat
```

Add the following data:

```text
1,'SULAIMAN','ORACLE'
2,'AHMED','C++'
3,'JOHN','CYBERSECURITY'
4,'SMITH','JAVA'
5,'CLARK','ORACLE'
```

The data looks like this:

| ID | NAME     | COURSE        |
| -: | -------- | ------------- |
|  1 | SULAIMAN | ORACLE        |
|  2 | AHMED    | C++           |
|  3 | JOHN     | CYBERSECURITY |
|  4 | SMITH    | JAVA          |
|  5 | CLARK    | ORACLE        |

---

# 3. CREATE DATABASE TABLE

Open **SQL*Plus** and create the table:

```sql
CREATE TABLE SULAIMAN_TEST
(
    ID NUMBER,
    NAME CHAR(50),
    COURSE VARCHAR2(100)
);
```

Expected result:

```text
Table created.
```

---

# 4. RUN SQL*LOADER

Open **Command Prompt**.

Run:

```text
sqlldr
```

Then execute SQL*Loader using the control file:

```text
C:\Users\ask20>sqlldr userid=apps/apps@EBSDB control='/u01/install/VISION/fs1/EBSapps/appl/fnd/12.0.0/reports/US/SULAIMANCONTROL.ctl'
```

### What happens?

SQL*Loader reads:

```text
SULAIMANCONTROL.ctl
```

The control file tells SQL*Loader to read:

```text
SULAIMANDATA.dat
```

Then SQL*Loader loads the data into:

```text
SULAIMAN_TEST
```

---

# 5. LOG FILE

After SQL*Loader runs, a log file is generated.

Example:

```text
SULAIMANCONTROL.log
```

The log file shows information about the loading process.

For example:

```text
Records read:        5
Records loaded:      5
Records rejected:   0
```

---

# 6. DISCARD FILE

The discard file contains records that do not match the selection criteria.

Example:

```text
SULAIMANCONTROL.dsc
```

If there are no discarded records, the file may be empty.

---

# 7. BAD FILE

The bad file contains records that could not be loaded because of errors.

Example:

```text
SULAIMANCONTROL.bad
```

If all records are correct, there should be no bad records.

---

# 8. CHECK THE DATABASE TABLE

After SQL*Loader finishes, check the table.

```sql
SELECT * FROM SULAIMAN_TEST;
```

Expected result:

```text
ID   NAME        COURSE
---  ----------  -------------
1    SULAIMAN    ORACLE
2    AHMED       C++
3    JOHN        CYBERSECURITY
4    SMITH       JAVA
5    CLARK       ORACLE
```

---

# DATA MIGRATION FLOW

```text
Legacy Data
    |
    ↓
SULAIMANDATA.dat
    |
    ↓
SULAIMANCONTROL.ctl
    |
    ↓
SQL*Loader
    |
    ↓
SULAIMAN_TEST
    |
    ↓
Oracle Database / EBS
```

---

# SIMPLE SUMMARY

**Data Migration**
Moving old data to a new system.

**SQL*Loader**
Oracle tool used to load data into database tables.

**Control File**
Tells SQL*Loader what to do.

**Data File**
Contains the old/legacy data.

**Log File**
Shows what happened during loading.

**Discard File**
Contains records that did not match the selection criteria.

**Bad File**
Contains records that caused errors.

**Inbound Interface**
Data goes **into EBS**.

**Outbound Interface**
Data goes **out of EBS**.

**FNDLOAD**
Used mainly for moving Oracle EBS/AOL setup data.

**UTL_FILE**
Can be used to write Oracle data to external files.
