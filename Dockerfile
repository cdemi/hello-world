FROM microsoft/dotnet:sdk AS build
WORKDIR /app
COPY ./src ./
RUN dotnet restore
RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:runtime AS runtime
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "hello-world.dll"]