Reference to setup Keycloak and React: https://dev.to/anushibin007/keycloak-oauth2-react-js-integration-34bl

## TODO
- Create gRPC server with a single endpoint to create a user alongside with her home directory
- Utilize Keycloak Custom SPI to integrate user registering in Keycloak with the user creation endpoint
- Develop gRPC's CRUD endpoints 
- Integrate REST API with gRPC server
- Setup init-data
- Develop additional gRPC's endpoints and integrate with the REST API
- Cleanup SpiceDB schema
- Setup init-data
- Implement recursive deletion
- Update frontend
- Review docker-compose and learn what I don't know (e.g. volumes)
	- Learn about Docker networks and how to use them in this project
- Fix image versions on docker-compose
- Prevent the "new enemy" problem
- Document Makefile commands
- Remove unneeded port forwarding on docker-compose
- Implement reverse search
	- Utilize SpiceDB's Watch API to listen to permission changes in real time to continuously update an authorized_principals or viewers array field inside each document in ElasticSearch.
- Check if using MySQL's data backup/restore is better than using Keycloak's.
- Reduce the keycloak import script execution duration:
	- Use the --optimize flag, to prevent Keycloak from running a slow, automatic Quarkus build step. It requires building an optimized version of Keycloak with the build command. https://www.keycloak.org/server/importExport
