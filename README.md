# JwtPhoenix

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Setup

Create the sample app:

```shell
mix phoenix.new jwt_phoenix --no-brunch --no-html
```

## Configuration

You need to export appropriate variables required for auth0 configuration.
You can check [config.exs](config/config.exs#L25-L32) to see that following environment variables are being used.

```shell
#!/bin/bash

export AUTH0_BASEURL="https://<app>.auth0.com/"
export AUTH0_APP_ID="<APP_ID>"
export AUTH0_APP_SECRET="<APP_SECRET>"
mix phoenix.server
```

## Example

Now, you can send curl requests:

```shell
curl http://localhost:4000/api/status # gives 401
curl -H "Authorization: Bearer <valid_jwt_token>" http://localhost:4000/api/status # gives 200

# when the token does not have app_metadata containing role admin
curl -H "Authorization: Bearer <jwt_token>" http://localhost:4000/api/admin # gives 403

curl -H "Authorization: Bearer <appropriate_jwt_token>" http://localhost:4000/api/admin # gives 200
```
