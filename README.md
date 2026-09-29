# my-drive

A Google Drive–like document storage app, built as a learning project focused on
fine-grained authorization with [SpiceDB](https://authzed.com/spicedb) (an
open-source implementation of Google's [Zanzibar](https://research.google/pubs/zanzibar-googles-consistent-global-authorization-system/)
authorization model).

## Why this project

I wanted hands-on practice designing and operating a Zanzibar-style permission
system beyond what a single service at a job lets you touch end to end —
schema design, relationship writes, permission checks, and how authorization
interacts with the rest of a real application (auth, storage, API design).
Document sharing/access control is a good fit for that: it needs real
hierarchy (folders contain files and other folders) and real inheritance
(permission on a folder should flow down to its contents), not just flat
ownership checks.

## Architecture

| Component | Role |
|---|---|
| **Keycloak** | Authentication (OIDC). Issues access tokens the API decodes to identify the caller. |
| **SpiceDB** | Authorization. Stores relationships (who owns/edits/views what) and answers permission checks and reverse lookups ("what can this user read?"). |
| **MongoDB** | Document storage (title/content). |
| **REST API** (`rest-api/`) | Go HTTP service. Document CRUD, enforced against SpiceDB on every read/write. |
| **Filesystem service** (`filesystem/`) | Go gRPC service (schema in `filesystem/proto/`). Hierarchical folders/files, sharing, and moving nodes — the more ambitious authorization model, still early. |
| **Frontend** (`react-frontend/`) | React + Vite + shadcn/ui. Document list/editor/viewer, Keycloak login. |

All services run via `docker-compose.yaml`; `schema.zed` holds the SpiceDB
schema and is written into SpiceDB automatically on startup.

## Two authorization models, on purpose

`schema.zed` currently defines two separate resource types, representing two
stages of the same idea:

- **`document`** — flat ownership. One relation (`owner`), three permissions
  (`read`/`write`/`delete`) all derived from it. This is what the REST API
  and frontend actually use today.
- **`node`** — hierarchical files/folders. Permissions (`edit`, `view`,
  `share`, `move_in`/`move_out`, ...) are derived from a mix of direct
  relations (`owner`, `editor`, `viewer`) **and** inheritance from the parent
  node (`parent->edit`, `parent->view`) — so permission on a folder flows down
  to everything inside it. This is the model the gRPC filesystem service is
  being built against.

The plan is to migrate the REST API's documents onto the `node` model once
the filesystem service covers the same ground, then retire the `document`
type.

## Current status

**Working:** Keycloak-authenticated REST API for documents (create, read,
update, delete, list — list uses SpiceDB's `LookupResources` to return only
documents the caller can read), backed by MongoDB, with a React frontend on
top.

**In progress:** the `filesystem` gRPC service. Only `CreateUser` is
implemented so far (and it doesn't yet provision the user's home folder). The
richer `node` permission model in `schema.zed` — hierarchy, sharing, move —
isn't wired up to any API yet.

See [TODO.md](TODO.md) for the full backlog.

## Running locally

Requires Docker + Docker Compose.

```sh
make spin-up-local-env   # docker compose up + restores reference data (SpiceDB relationships, Mongo docs, Keycloak realm)
```

Then, to run individual services outside their containers during development:

```sh
make start-local-frontend    # react-frontend/, via Vite dev server
make start-local-rest-api    # rest-api/
make start-local-filesystem  # filesystem/
```

`make dump-init-data` snapshots the current SpiceDB relationships, Mongo
documents, and Keycloak realm/users back into `data/`, so `load-init-data`
can restore a known-good local environment on demand.
