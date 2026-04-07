#Make sure you have java 8 installed
FROM amazoncorretto:8

#The project should open in 8080 and you get a message by pressing the button.
EXPOSE 8080

#directory by convention
WORKDIR /usr/src/app

#Build the project with ./mvnw package
COPY . .
RUN ./mvnw package

#Run with java -jar ./target/docker-example-1.1.3.jar
CMD ["java", "-jar" ,"./target/docker-example-1.1.3.jar"]

