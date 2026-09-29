# TODO

Moved out of README.md so the README can stay a description of what the
project is, not a running task list.

## Filesystem gRPC service (the current focus)

- Finish `CreateUser`: provision the user's home folder alongside the user.
- Implement the rest of the CRUD endpoints (`CreateNode`, `GetNode`,
  `UpdateNode`, `DeleteNode`, `ListFolderContents`).
- Implement sharing endpoints (`ShareNode`, `ListNodeShares`,
  `UpdateNodeShare`, `UnshareNode`) and `MoveNode`.
- Implement recursive deletion (deleting a folder deletes its contents).
- Integrate the REST API with the gRPC filesystem server, and eventually
  retire the flat `document` SpiceDB type in favor of `node`.
- Utilize a Keycloak Custom SPI to integrate user registration in Keycloak
  with the `CreateUser` endpoint, so the two stay in sync.
- Clean up `schema.zed` once the `node` model is the only one in use.
- Prevent the "new enemy" problem (a principal that gains and loses access to
  a resource in the same relationship-write batch shouldn't get a stale
  answer) — see [SpiceDB's docs on the new enemy problem](https://authzed.com/blog/new-enemies).
- Implement reverse search: use SpiceDB's Watch API to listen to permission
  changes in real time and keep an `authorized_principals`/`viewers` array
  field on each document in sync (for use with a search index).

## Frontend

- Update the frontend to work against the filesystem service instead of the
  flat document REST API once that's ready.

## Infra / ops

- Review `docker-compose.yaml` end to end and understand every piece
  (particularly volumes and networks — this project is also where I'm
  learning those).
- Fix image versions pinned in `docker-compose.yaml`.
- Remove unneeded port forwarding.
- Document Makefile commands directly in the Makefile or README.
- Decide whether MySQL's backup/restore is a better fit than Keycloak's own
  export/import for snapshotting realm data.
- Speed up the Keycloak import script — investigate the `--optimize` flag,
  which avoids Keycloak's automatic Quarkus build step on startup (requires
  building an optimized Keycloak image first; see
  [Keycloak's import/export docs](https://www.keycloak.org/server/importExport)).

## Reference

- [Keycloak + React OAuth2 integration walkthrough](https://dev.to/anushibin007/keycloak-oauth2-react-js-integration-34bl)
  used when wiring up authentication.
