FROM node:20-alpine AS ui-build
WORKDIR /root/minecraft

RUN apk upgrade
RUN apk add openjdk17-jre

EXPOSE 25565
ENTRYPOINT [ "java" ]
CMD [ "-Xms4G", "-Xmx16G", "-Dfml.readTimeout=180", "-Dfml.queryResult=confirm", "@java9args.txt", "-jar", "lwjgl3ify-forgePatches.jar", "nogui" ]
