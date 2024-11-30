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

It exists just one endpoint:

```
/short_messages

Body: { short_message: { message: "Test" } }

```
