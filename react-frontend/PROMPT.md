Create the layout of a web interface for desktop.
Use open fonts from Google Fonts.
The system mimics Google Docs.
A visitor can login and become a user.
A user can create/read/list/edit/delete documents.
Documents have title and contents - the latter is in rich text.

1. Landing Page
This is also the landing page.
It must have a button to redirect the user to login into a Keycloak server.

2. Sign In
This is a customized Keycloak sign in page.
Search Keycloak sign in page as reference.
This page has a login form in the center containing the following:
- a text input for username
- a password input for user password with a button to toggle the password visibility
- a checkbox to remember login
- a "Forgot Password?" link
- a Sign In button
- a link to registration like "New user? <a>Register</a>"

3. Sign Up
This is a customized Keycloak register page.
Search Keycloak register page as reference.
This page has a register form in the center containing the following:
- a text input for username
- a password input for user password with a button to toggle the password visibility
- a password input to repeat the password with a button to toggle the password visibility
- a Register button
- link to go back to the Login Page

4. Documents List
In this page, the user will see all her documents listed by their titles with buttons to read (to open it in Document Viewr) and edit (to open it in Document Editor).

5. Document Editor
This page is a WYSIWYG rich text editor of documents.

6. Document Viewer
This page displays the document leveraging its rich text formatting.
