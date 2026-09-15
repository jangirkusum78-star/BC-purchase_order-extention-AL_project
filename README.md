# Purchase Order Extension – Business Central AL Practice Project
Overview

This project is a practice project for learning Microsoft Dynamics 365 Business Central AL development.

The project demonstrates how to extend the standard Purchase Order functionality without modifying the original Microsoft Business Central objects.

Key Area:

Table extensions
Page extensions
Enums
Report

This project is primarily intended for learning and practice purpose

Project Objective

Instead of changing the standard Purchase Header table or Purchase Order page directly, we can uses AL extension objects.
# Purchase-Order-Extension/
│
├──  Tables/
│   ├── table_extension.al
│   └── .al
│
├──  Pages/
│   ├── page.al
│   ├── cardpage_extnsn.al

│
├──  Reports/
│   ├── Purchase_order_report1.al
│   └──  Report Layout/
│       └── PurchaseReport.rdl
│
├──  .vscode/
│   ├── launch.json
│   
│
├── app.json
├── README.md
├── requirements.txt
└── .gitignore


The basic customization flow is:

Purchase Header
      │
      ▼
Table Extension
      │
      ├── Urgent Order
      ├── Delivery Deadline
      ├── Buyer Notes
      └── Order Satisfaction
      │
      ▼
Purchase Order Page Extension
      │
      ▼
User Interface

Table Extension
Purpose : The table extension adds additional fields to the standard Purchase Order.

Custom Fields 
1. Urgent Order
      Data type: Boolean
It can be used to indicate whether a particular purchase order requires urgent processing.
Urgent Order
    Yes / No

2.Delivery Deadline
   Data type: Date
It represents the expected or required deadline for delivery.
Delivery Deadline
    15/10/2026
3.Buyer Notes
The field is limited to a defined text length, providing practice with Business Central text field definitions.

4.Order Satisfaction
Data type: Enum
Instead of allowing arbitrary text, an Enum provides a predefined set of possible values.

Enums : a standalone AL object that defines a fixed, read-only list of named constants (values) used to classify statuses, types, or business conditions.
Page extension : A Page Extension allows developers to extend an existing Business Central page by adding or modifying:
.Fields
.Actions
.FactBoxes
.User interface behavior

An Action is a button or command that allows a user to perform an operation from a Business Central page.

This purchase order extension  adds two actions:

Approve Internally
A custom action that demonstrates how an action can execute AL code when the user clicks a button.
action(ApproveInternally) - it displays a confirmation message.

Send Alert
A custom action that checks the value of the Order_satis field and displays a different message depending on the selected satisfaction level.
This demonstrates:
OnAction() triggers
if / else if conditions
Enum values
Record field access
User messages
Project Structure
Purchase Order Extension


# Important AL Project Files
app.json
app.json is the manifest file of an AL extension.

It contains important project information such as:
Extension name
Publisher
Version
Application version
Runtime version
Dependencies
Object ranges
Example:

{
    "id": "your-extension-id",
    "name": "Purchase Order Extension",
    "publisher": "Your Name",
    "version": "1.0.0.0"
}

When we create a new AL project in Visual Studio Code, Business Central's AL extension tooling automatically creates the app.json file for you.

# launch.json
launch.json contains the debugging and Business Central connection configuration used by Visual Studio Code.

It can specify information such as:
Business Central server
Environment
Tenant
Authentication settings
Startup object
When you create a new AL project using the AL: Go! command in Visual Studio Code, the AL development environment generates the required project files, including app.json and the .vscode/launch.json configuration.
launch.json can contain environment-specific configuration, so review it before committing a public repository.



Technologies
Microsoft Dynamics 365 Business Central
AL Language
Visual Studio Code
Business Central Sandbox
Learning Objectives


# "Purchase Order Report"
Purchase Order Report – Business Central
Overview
A custom Purchase Order Report developed using AL for Microsoft Dynamics 365 Business Central. The report retrieves Purchase Order header and line details, enriches the data with vendor GST/state information and company branding, and generates a formatted document using an RDLC layout.

Key Features

- Custom Purchase Order report (Report ID: 50143)
- Displays company logo from Company Information
- Retrieves vendor name and GST registration number
- Converts State Code into a readable State Description
- Displays Purchase Line details:
- Item/Account No.
- Quantity
- HSN/SAC Code
- Unit of Measure
- Amount
  
Links Purchase Header with Purchase Lines using DataItemLink
Uses a custom RDLC layout for document formatting
Includes user validation before report execution


Report Processing

The report uses the Purchase Header as the parent dataitem and Purchase Line as the child dataitem.

The Purchase Line records are filtered using:

DataItemLink = "Document No." = field("No.");


The report also performs a State table lookup in OnAfterGetRecord() to convert the Purchase Order's state code into its corresponding description.

The company logo is loaded in OnPreReport() using the Company Information record.

📋 Dataset
Field	Source
Vendor Name	Purchase Header
GST Registration No.	Purchase Header
State Code	Purchase Header
State Description	State Table
No.	Purchase Line
Quantity	Purchase Line
HSN/SAC Code	Purchase Line
Amount	Purchase Line
Unit of Measure	Purchase Line
Company Logo	Company Information
