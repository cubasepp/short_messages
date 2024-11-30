# README

This is an example short_message endpoint.

## Get started

Install gems:

```
bundle install
```

Start docker database:

```
docker compose up
```

Run test:

```
bundle exec rspec spec
```

## Endpoint

Short Messages Endpoint:

```
curl --request POST \
  --url http://localhost:3000/short_messages \
  --header 'Content-Type: application/json' \
  --data '{ "short_message": { "message": "Hallo World" } }'

```
