FROM derkades/webdav:latest

# Allow passing UID and GID as build arguments and set them as environment variables
ARG UID=1000
ARG GID=1000

ENV UID=${UID}
ENV GID=${GID}

# Modify the user and group IDs for www-data
RUN usermod -u ${UID} www-data && \
    groupmod -g ${GID} www-data

# Ensure the permissions are correct for the /media directory
RUN chown -R www-data:www-data /media
