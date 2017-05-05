FROM cassandra:3.9

# Install cURL command line util so that the entypoint can communicate
# with Rancher's metadata service.
RUN apt-get update
RUN apt-get install -y curl

COPY service-entrypoint.sh /service-entrypoint.sh
ENTRYPOINT ["/service-entrypoint.sh"]

CMD ["cassandra", "-f"]

