Feature: Login

As a client
I want to access my account and keep logged in
to be allowed to quickly see and answer surveys

Scenario: Valid Credentials
Client has informed its valid credentials
when request to make login
System must redirect user to research screen
and keep user logged in

Scenario: Invalid Credentials
Client has informed its invalid credentials
when request to make login
System shall return an error message