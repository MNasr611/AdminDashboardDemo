*** Settings ***
Resource    ../Hooks/Hooks.robot
Resource    ../DriverFactory/DriverFactory.robot


#Login Page
Resource    ../Keywords/Login/Login.robot
Resource    ../Keywords/Login/2fa.robot


#Home Page
Resource    ../Keywords/Home/Home.robot



#Dashboard Page
Resource    ../Keywords/Dashboard/Dashboard.robot


#Attendees Page
Resource    ../Keywords/Attendees/Attendees.robot