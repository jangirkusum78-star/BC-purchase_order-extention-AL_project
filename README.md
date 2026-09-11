Purchase Order Extension – Business Central AL Practice Project
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

This project adds two actions:

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


Important AL Project Files
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

launch.json
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

Page Extensions
Extending standard Business Central pages
Adding fields to existing pages
Creating page actions
OnAction() triggers
Conditional statements
Enum usage
Accessing record fields using Rec
AL project structure
app.json
launch.json
Publishing and debugging an extension in a Business Central Sandbox
Purpose
The goal is to understand how custom AL functionality can be added to standard Business Central objects while following the extensi

report 50143 "Purchase Order Report"
