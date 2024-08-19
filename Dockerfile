FROM derkades/webdav:latest

# Allow passing UID, GID, and TZ as build arguments and set them as environment variables
ARG UID=1000
ARG GID=1000
ARG TZ=Europe/London

ENV PUID=${UID}
ENV PGID=${GID}
ENV TZ=${TZ}

# Modify the user and group IDs for www-data
RUN usermod -u ${PUID} www-data && \
    groupmod -g ${PGID} www-data

# Set the timezone
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# Ensure the permissions are correct for the /media directory
RUN chown -R www-data:www-data /media
