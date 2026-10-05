# ORACLE WORKFLOW (OWF)

## What is Oracle Workflow?

**OWF = Oracle Workflow**

Oracle Workflow is used to define a **business process** with different steps.

### Simple Workflow Diagram

```text
START
  ↓
PROCESS
  ↓
END
```

---

# Example: Applying for Leave

For example, an employee wants to apply for leave.

```text
START
  ↓
Fill Leave Form
  ↓
Send to Manager
  ↓
Manager Approves
  ↓
Confirmation Email
  ↓
END
```

So, Oracle Workflow controls the steps from **Start** until **End**.

---

# IMPORTANT NOTE

Login as:

**SYSADMIN**

You need the correct responsibility to **run and manage the Workflow**.

---

# BASIC WORKFLOW STEPS

### 1. Define Business Rules

First, define the rules for the business process.

Example:

```text
Employee applies for leave
        ↓
Manager receives request
        ↓
Manager approves
        ↓
Employee receives confirmation
```

---

### 2. Add Responsibility

Navigate to:

```text
System Administrator
        ↓
User
        ↓
Define
```

Query the user:

```text
SULAIMAN
```

Add the responsibility:

```text
Workflow Administrator Web Applications
```

---

# ORACLE WORKFLOW BUILDER

The Workflow is created using:

**Oracle Workflow Builder (GUI)**

Open **Workflow Builder**.

---

# LAB – CREATE A SIMPLE WORKFLOW

## 1. Open Workflow Builder

Open:

**Oracle Workflow Builder**

Then:

```text
File
 ↓
Quick Start Wizard
```

---

# 2. Create Workflow Process

Create the following:

```text
WF_FIRST
```

The workflow process will be:

```text
WF_FIRST
```

---

# 3. Create Message

Right-click the **Messages** section.

Create:

```text
WF_MESSAGE
```

Set the message body to:

```text
This is a message from Oracle Workflow!!
```

So:

```text
Message Name:
WF_MESSAGE

Body:
This is a message from Oracle Workflow!!
```

---

# 4. Create Notification

Right-click **Notifications**.

Create:

```text
WF_NOTIFY1
```

For the **Message**, attach:

```text
WF_MESSAGE
```

So the notification will display the message:

```text
This is a message from Oracle Workflow!!
```

---

# 5. Create the Workflow Diagram

Drag the notification between **START** and **END**.

The diagram should look like:

```text
        START
          |
          ↓
    WF_NOTIFY1
          |
          ↓
         END
```

---

# 6. Connect START to Notification

Right-click:

```text
START
```

Then drag a line to:

```text
WF_NOTIFY1
```

---

# 7. Connect Notification to END

Right-click:

```text
WF_NOTIFY1
```

Then drag a line to:

```text
END
```

Final diagram:

```text
START
  |
  ↓
WF_NOTIFY1
  |
  ↓
END
```

---

# 8. Set Notification User

Right-click:

```text
WF_NOTIFY1
```

Select:

```text
Properties
```

Go to the:

```text
Node
```

tab.

Set the value to:

```text
SULAIMAN_WFUSER
```

This is the **EBS user** who will receive the notification.

---

# 9. Save the Workflow to Database

Go to:

```text
File
 ↓
Save As
 ↓
Database
```

Use the database connection:

```text
apps/apps@EBSDB
```

Save the workflow.

---

# 10. Run the Workflow from EBS

Go back to **Oracle EBS**.

Use:

**Developer Studio**

Run the workflow process created in Workflow Builder.

---

# 11. Search for the Workflow

In Developer Studio:

```text
Name: WF_FIRST
```

Click:

```text
Search
```

---

# 12. Run the Workflow

Select:

```text
WF_FIRST
```

Then click:

```text
Run
```

The workflow process will start.

---

# 13. Open Status Monitor

Go to:

```text
Status Monitor
```

Search for:

```text
WF_FIRST
```

Click:

```text
Search
```

---

# 14. Check the Notification

Select:

```text
Notification
```

Then open it.

You should see:

```text
This is a message from Oracle Workflow!!
```

---

# FINAL WORKFLOW

```text
             START
               |
               ↓
         WF_NOTIFY1
               |
               ↓
              END
```

### Notification

```text
This is a message from Oracle Workflow!!
```

---

# SIMPLE EXPLANATION

**Oracle Workflow** helps Oracle EBS control a business process.

For example:

```text
Employee
   ↓
Apply for Leave
   ↓
Manager
   ↓
Approve
   ↓
Confirmation
```

In this lab:

* **WF_FIRST** → Workflow Process
* **WF_MESSAGE** → Contains the message
* **WF_NOTIFY1** → Sends/displays the notification
* **SULAIMAN_WFUSER** → User who receives the notification
* **START** → Workflow begins
* **END** → Workflow finishes

### Complete Flow

```text
START
  ↓
WF_FIRST
  ↓
WF_NOTIFY1
  ↓
"This is a message from Oracle Workflow!!"
  ↓
END
```
