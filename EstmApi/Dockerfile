# Étape de Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copier les fichiers projet et restaurer
COPY *.csproj ./
RUN dotnet restore

# Copier tout le reste et publier
COPY . ./
RUN dotnet publish -c Release -o out

# Étape finale
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/out .
ENTRYPOINT ["dotnet", "EstmApi.dll"]