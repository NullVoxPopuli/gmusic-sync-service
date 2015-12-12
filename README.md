# gmusic-sync-service
A lightweight service for DJing google music


### Creating a user

`POST /users.json`
with the params:
```
user[email]
user[password]
user[password_confirmation]
```

### Signing In

`POST /users/sign_in.json`

this will give you your token to use on all requests

### Update your current song

`POST /api/songs.json`

Headers must be set to what was received from signing in:

`token`
`email`

### Retrieve a person's current song

`GET /api/songs/:user_id/current.json`

This is unauthenticated, to people don't need to have an account to listen
