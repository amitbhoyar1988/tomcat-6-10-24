# Use the official Tomcat base image
FROM tomcat:9.0

# Copy your web application WAR file to the webapps directory
COPY **/*.war /usr/local/tomcat/webapps/

# Expose port 8080 (the default Tomcat port)
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
