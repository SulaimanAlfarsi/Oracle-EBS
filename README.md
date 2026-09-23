# Oracle EBS

A collection of step-by-step guides and PL/SQL scripts for common Oracle E-Business Suite (EBS) R12 and Oracle Forms/Reports tasks — user/security administration, custom forms, custom reports, and standalone PL/SQL procedures/functions registered as concurrent programs.

## Contents

### Administration & Security
| File | Description |
|---|---|
| [Create New User in EBS.md](Create%20New%20User%20in%20EBS.md) | Creates a new EBS user via **System Administrator → Security → User → Define**, assigns the Application Developer and System Administrator responsibilities, and verifies the user in the `FND_USER` table. |
| [Query by exampel.md](Query%20by%20exampel.md) | Demonstrates the Query by Example (QBE) feature to search for users (e.g. names starting with `T`) in the User Define form. |
| [Changing Field Name in EBS.md](Changing%20Field%20Name%20in%20EBS.md) | Uses Forms Personalization (Help → Diagnostics → Custom Code → Personalize) to change the prompt text of the `LAST_NAME` field on the People form. |
| [Restricting Personalization Access — Site Level.md](Restricting%20Personalization%20Access%20—%20Site%20Level.md) | Disables the `Utilities:Diagnostics` and `Utilities:SQL Trace` profile options at both Site and User level to prevent end users from accessing form personalization/diagnostics. |
| [SSH.md](SSH.md) | Minimal instructions for connecting to the EBS server via WinSCP using host, username, and password. |
| [Create Lookup in Oracle EBS.md](Create%20Lookup%20in%20Oracle%20EBS.md) | Creates an extensible Lookup Type (`SULAIMAN_LOOKUP_DEPT`) under **Application Developer → Application → Lookups → Application Object Library** with sample department lookup codes (FIN, IT, SALES, PROD, MKTG). |

### Oracle Forms
| File | Description |
|---|---|
| [Create Canvas and Data Block in Oracle Forms.md](Create%20Canvas%20and%20Data%20Block%20in%20Oracle%20Forms.md) | Builds a simple single-block form: creates canvas `CAN_EMP` and data block `EMP`, saves as `SULAIMAN_EMP.fmb`, and compiles to `SULAIMAN_EMP.fmx`. |
| [Create Master Block DEPT and Detail Block EMP.md](Create%20Master%20Block%20DEPT%20and%20Detail%20Block%20EMP.md) | Builds a master-detail form (`DEPT` → `EMP`) linked on `DEPTNO`, letting Forms auto-generate the master-detail triggers/program units. Saved as `SULAIMAN_MASTER_DETAIL.fmb`/`.fmx`. |
| [Create Master-Detail Form in Oracle Forms and EBS.md](Create%20Master-Detail%20Form%20in%20Oracle%20Forms%20and%20EBS.md) | End-to-end walkthrough building a master-detail form from the `APSTAND.fmb` template (`SULAIMAN_MD.fmb`) with a `DEPT` master block and tabular `EMP` detail block joined via a manual `FK_DEPTNO` relationship, then registering the Form, Function, and Menu entry in EBS and running it under `SULAIMAN_RESP_FORM`. |
| [Create LOV in Oracle Forms.md](Create%20LOV%20in%20Oracle%20Forms.md) | Adds a List of Values to `SULAIMAN_EMP.fmb` (saved as `SULAIMAN_EMP_LOV.fmb`) using the LOV Wizard with a record group query on `EMP.DEPTNO`, then registers and runs the form to insert a new record via the LOV. |
| [Place .fmx File in EBS.md](Place%20.fmx%20File%20in%20EBS.md) | Copies the compiled `SULAIMAN_MASTER_DETAIL.fmx` to the EBS forms directory (`fnd/12.0.0/forms/US`) via WinSCP. |
| [Register Form in EBS.md](Register%20Form%20in%20EBS.md) | Full registration flow for a custom form: move the `.fmx` file, then create the Form, Function, Menu, and Responsibility objects in EBS and assign the responsibility to a user so the form appears in the application menu. |

### Oracle Reports
| File | Description |
|---|---|
| [Create report and register it in EBS.md](Create%20report%20and%20register%20it%20in%20EBS.md) | Builds a basic tabular EMP details report in Reports Builder (`SULAIMAN_EMP.rdf`) and registers it in EBS as an Executable + Concurrent Program, then adds it to an existing request group and runs it. |
| [Create report and register it in EBS with parameters.md](Create%20report%20and%20register%20it%20in%20EBS%20with%20parameters.md) | Same flow as above, but the report accepts a `DEPTNO` (`:DNO`) parameter — covers creating the Executable, Concurrent Program, defining the `DNO` parameter with value set `NUMBER_15`, adding it to a request group, and running/viewing output. |
| [Create Value Set and Add It to Report Parameter.md](Create%20Value%20Set%20and%20Add%20It%20to%20Report%20Parameter.md) | Creates a table-validated Value Set (`SULAIMAN_VS_DNO`, based on `EMP.DEPTNO`) and attaches it to a concurrent program's parameter so the parameter is validated against real department numbers. |

### PL/SQL Procedures & Functions
| File | Description |
|---|---|
| [Procedure_Function.sql](Procedure_Function.sql) | Minimal examples of a stored **procedure** (`SULAIMAN_PR_TEST`) and **function** (`SULAIMAN_FN_TEST`) that print/return a welcome message — a starting template for EBS concurrent program PL/SQL. |
| [SYSDATE_Procedure.sql](SYSDATE_Procedure.sql) | Procedure `SULAIMAN_PR_SYSDT` that selects `SYSDATE` and writes it to the concurrent request log and output via `FND_FILE`. |
| [Register SYSDATE procedure in EBS.md](Register%20SYSDATE%20procedure%20in%20EBS.md) | Includes the `SULAIMAN_PR_SYSDT` source and the steps to register it as an Executable/Concurrent Program (`SULAIMAN_PR_SYSDT_PG`), add it to a request group, and submit/view the request output. |
| [Factorial_Calculation.sql](Factorial_Calculation.sql) | Anonymous PL/SQL block that prompts for a number (`&NUM`) and prints its factorial, with handling for negative input and invalid (non-numeric) input. |
| [Factorial_Procedure.sql](Factorial_Procedure.sql) | Stored procedure `SULAIMAN_PR_FACTORIAL_2(ERRBUF, RETCODE, N)` that computes the factorial of `N` using custom exceptions for the 0/1 and negative-input cases, writing results via `FND_FILE`. |
| [Register the factorial procedure in EBS.md](Register%20the%20factorial%20procedure%20in%20EBS.md) | Steps to register a factorial procedure as Executable/Concurrent Program `SULAIMAN_PR_FAC_PG` with an `N` parameter (value set `NUMBER_15`), add it to a request group, and run it. |

## Naming Conventions

Most custom objects (forms, reports, procedures, executables, concurrent programs, value sets, responsibilities) are prefixed with `SULAIMAN_` to identify them as custom objects created by this developer, following typical EBS custom-object naming practice.

## Typical Custom Object Registration Flow

The guides in this repo generally follow the standard EBS customization pattern:

1. **Build** the object (PL/SQL procedure, Oracle Forms `.fmb`/`.fmx`, or Oracle Reports `.rdf`).
2. **Deploy** the compiled file to the EBS application-tier file system via WinSCP (see [SSH.md](SSH.md)).
3. **Register** it in EBS as an Executable and, for reports/procedures, a Concurrent Program (optionally with parameters and value sets).
4. **Expose** it by adding it to a Request Group / Menu / Responsibility so end users can access it.
5. **Test** by submitting a request or opening the form/menu under the assigned responsibility.
