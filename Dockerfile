## BUILDING
##   (from project root directory)
##   $ docker build -t php-for-nuhajat-simpeg .
##
## RUNNING
##   $ docker run -p 9000:9000 php-for-nuhajat-simpeg
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:9000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/bitnami-containers/minideb-extras:jessie-r14-buildpack

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="ed2cs2y" \
    STACKSMITH_STACK_NAME="PHP for nuhajat/simpeg" \
    STACKSMITH_STACK_PRIVATE="1"

# Install required system packages
RUN install_packages libc6 zlib1g libxslt1.1 libtidy-0.99-0 libreadline6 libncurses5 libtinfo5 libmcrypt4 libldap-2.4-2 libstdc++6 libgmp10 libpng12-0 libjpeg62-turbo libbz2-1.0 libxml2 libssl1.0.0 libcurl3 libfreetype6 libicu52 libgcc1 libgcrypt20 libsasl2-2 libgnutls-deb0-28 liblzma5 libidn11 librtmp1 libssh2-1 libgssapi-krb5-2 libkrb5-3 libk5crypto3 libcomerr2 libgpg-error0 libp11-kit0 libtasn1-6 libnettle4 libhogweed2 libkrb5support0 libkeyutils1 libffi6 libsybdb5 libpq5

RUN bitnami-pkg install php-7.1.5-0 --checksum f5d213bbb665ddb10f253497e797a3b626deab8bd7ae399845755e6be9890980

ENV PATH=/opt/bitnami/php/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# CodeIgniter template
COPY . /app
WORKDIR /app

EXPOSE 9000
CMD ["php", "-S", "0.0.0.0:9000"]
