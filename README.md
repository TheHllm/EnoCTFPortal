# EnoLandingPage

## docker-compose

```yaml
version: '3'

services:
  enolandingpage:
    build: .
    environment:
      - 'EnoLandingPage__Title=FoobarCTF'
      - 'EnoLandingPage__StartTime=2020-11-22T15:00:00Z'
      - 'EnoLandingPage__RegistrationCloseOffset=48'
      - 'EnoLandingPage__CheckInBeginOffset=12'
      - 'EnoLandingPage__CheckInEndOffset=2'
      - 'EnoLandingPage__HetznerVulnboxType=cx11'
      - 'EnoLandingPage__HetznerCloudApiToken=...'
      - 'EnoLandingPage__HetznerVulnboxImage=...'
      - 'EnoLandingPage__HetznerVulnboxPubkey=...'
      - 'EnoLandingPage__HetznerVulnboxLocation=...'
      - 'EnoLandingPage__OAuthClientId=...'
      - 'EnoLandingPage__OAuthClientSecret=...'
      - 'EnoLandingPage__AdminSecret=...'
    ports:
      - '5001:80'
    volumes:
      - ./sessions:/root/.aspnet/DataProtection-Keys
      - ./data:/app/data
      - ./scoreboard:/app/wwwroot/scoreboard
```

## Reverse Proxy Configuration

The reverse proxy must set the [XFP header](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Proto) and allow https connections.

## Concept

For Better reusability the Frontent makes use of an IFrame Front Page.

You can rebrand the outer frame by including CSS and supplying some Environment variables but the Main Page can be completley custom made.

You can even use your own framework for the landing page because it is completly seperate.
