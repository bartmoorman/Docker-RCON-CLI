### Docker Run
```
docker run \
--rm \
--interactive \
--tty \
--name rcon-cli \
bmoorman/rcon-cli:latest \
--host minecraft \
--password password
```

### Environment Variables
|Variable|Description|Default|
|--------|-----------|-------|
|TZ|Sets the timezone|`America/Denver`|
|RCON_HOST|Sets RCON host|`<empty>`|
|RCON_PORT|Sets RCON port|`25575`|
|RCON_PASSWORD|Sets RCON password|`<empty>`|
