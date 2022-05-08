FROM openjdk:8-oracle

WORKDIR /server

ADD ./forge-1.12.2-14.23.5.2859-installer.jar ./forge-installer.jar
RUN java -jar forge-installer.jar --installServer \
	&& echo "eula=true" >> eula.txt

ADD ./mods ./mods

VOLUME ["/server"]
EXPOSE 25565
CMD ["java", "-Xms1G", "-Xmx2G", "-jar", "forge-1.12.2-14.23.5.2859.jar"]