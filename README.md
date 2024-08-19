A dockeriezd WebDAV server based on Nginx. Example usage:

```
services:
  webdav:
    image: derkades/webdav
    volumes:
      - /home/webdav-container:/data
    ports:
      - '8418:80'
    environment:
      USERNAME: user
      PASSWORD: acLy_QCw1pynL
      TZ: Europe/London # Specify a timezone to use
      PUID: 1000 # User ID to run as
      PGID: 1000 # Group ID to run as
    restart: unless-stopped
```

Always runs as user 1000, hard coded. This makes it compatible with linuxserver.io containers.
