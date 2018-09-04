FROM microsoft/dotnet:2-sdk
WORKDIR /app
COPY ./src ./
RUN dotnet restore && dotnet publish -c Release -o out
ENTRYPOINT ["dotnet", "out/hello-world.dll"]