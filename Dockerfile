FROM node:20-alpine AS ui-build
WORKDIR /root/minecraft

RUN apk upgrade && apk add openjdk17-jdk
RUN apk add unzip
ADD https://downloads.gtnewhorizons.com/ServerPacks/GT_New_Horizons_2.7.2_Server_Java_17-21.zip .
RUN unzip GT_New_Horizons_2.7.2_Server_Java_17-21.zip && rm GT_New_Horizons_2.7.2_Server_Java_17-21.zip
RUN rm eula.txt && echo 'eula=true' > eula.txt

EXPOSE 25565
ENTRYPOINT [ "java" ]
CMD [ "-Xms4G", "-Xmx16G", "-Dfml.readTimeout=180", "@java9args.txt", "-jar", "lwjgl3ify-forgePatches.jar", "nogui" ]