# machinetest_web

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

## Setup Instructions

### Clone the Repository:
Clone the provided source code repository using the following command:

 - git clone https://github.com/haadiyaa/employee_machinetest.git  
Use code with caution.  

Install Dependencies:  
Navigate to the project directory and run the following command to install dependencies:  

Bash  
 - flutter clean  
 - flutter pub get  

Firebase Configuration (Optional):  
If you are using your own Firebase project:  

Replace the placeholder values in lib/firebase_options.dart with your Firebase project credentials.  

I have used firebase for user authentication and GetX state management system in this project.  
The depenedencies which I have used are:  

 - cupertino_icons: ^1.0.8  
 - table_calendar: ^3.1.2  
 - get: ^4.6.6
 - http: ^1.2.2  
 - firebase_core: ^2.24.2  
 - firebase_auth: ^4.16.0  
 - cloud_firestore: ^4.14.0  
 - shimmer: ^3.0.0

## Functionality
The application provides the following functionalities for managing employee data:  

### User Authentication:  

 - Sign up with email and password.  
 - Log in with existing credentials.  
 - Log out from the application.  

### Employee Management:  

 - Fetch and display a list of all employees.  
 - View details of a single employee.  
 - Create new employee records.  
 - Update existing employee records.  
 - Delete employee records.  

 This documentation provides a basic overview of the Employee Management Dashboard application. Feel free to explore the source code for a deeper understanding of the implementation details.      