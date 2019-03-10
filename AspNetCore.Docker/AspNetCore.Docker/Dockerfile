FROM microsoft/dotnet:2.1-aspnetcore-runtime
WORKDIR /app
COPY . .
EXPOSE 8080
ENTRYPOINT ["dotnet", "AspNetCore.Docker.dll", "--server.urls", "http://*:8080"]