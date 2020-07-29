FROM mdwikira/atlas-sdk

MAINTAINER Tiramisu Web Apps http://www.tirasu.com/

COPY entrypoint.sh /entrypoint.sh

RUN sed -i -e 's/\r//g' /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
