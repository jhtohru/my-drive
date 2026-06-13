# 1. Configure Keycloak Admin Console
Before Postman can request tokens, Keycloak needs to recognize it as a valid application.

* Log into your Keycloak Admin Console.
* Select your target Realm from the top-left dropdown menu.
* Navigate to Clients in the left sidebar and click Create client.
* Fill out the general settings:
  * **Client type:** OpenID Connect
  * **Client ID:** postman (or any preferred identifier)
* Proceed to the Capability Config page:
  * **Client Authentication:** Turn ON if you want a private client with a secret, or leave OFF for a public desktop client.
  * **Authentication Flow:** Ensure Standard flow is checked.
* Proceed to the Login settings page:
  * **Valid redirect URIs:** Add `https://oauth.pstmn.io/v1/browser-callback` (or `https://oauth.pstmn.io/v1/callback`).
* Click Save.
* *(Optional)* If you enabled Client Authentication, click on the Credentials tab that appears at the top and copy the Client Secret.


# 2. Configure Postman Authorization Settings
It is best practice to set authentication at the Collection level so all individual requests inherit it automatically.

1. Open Postman and select your API Collection.
2. Click on the Authorization tab.
3. Change the Type dropdown selection to OAuth 2.0.
4. Scroll down to the Configure New Token section and enter these parameters:

| Field | Value |
| :--- | :--- |
| **Token Name** | Keycloak Token |
| **Grant Type** | Authorization Code (or Authorization Code (PKCE)) |
| **Callback URL** | `https://oauth.pstmn.io/v1/browser-callback` (Check "Authorize using browser" if needed) |
| **Auth URL** | `http://<YOUR_KEYCLOAK_SERVER>:<PORT>/realms/<YOUR_REALM>/protocol/openid-connect/auth` |
| **Access Token URL** | `http://<YOUR_KEYCLOAK_SERVER>:<PORT>/realms/<YOUR_REALM>/protocol/openid-connect/token` |
| **Client ID** | postman (Must match step 1) |
| **Client Secret** | (Provide secret here if Client Authentication was turned ON) |
| **Scope** | openid |


# 3. Fetch and Apply the Token
1. Scroll to the bottom of the Configuration window and click the Get New Access Token button.
2. A browser window or login popup will open displaying your Keycloak login screen.
3. Enter the credentials of a registered user inside that Keycloak realm.
4. After successful login, Postman will catch the token redirection.
5. Click Use Token in the Postman window to apply it to your context.