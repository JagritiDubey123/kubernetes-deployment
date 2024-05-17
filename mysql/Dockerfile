FROM mysql:latest

# Set MySQL environment variables
ENV MYSQL_ROOT_PASSWORD =jagriti@123
ENV MYSQL_DATABASE=employees_db

# Copy database dump file into the container
COPY mysql/script.sql /docker-entrypoint-initdb.d/
