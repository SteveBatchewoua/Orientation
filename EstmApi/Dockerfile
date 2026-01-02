# Étape de Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# 1. On copie tout le contenu du repo
COPY . .

# 2. On cherche le fichier .csproj et on restaure
# Cette commande trouve le fichier .csproj même s'il est dans EstmApi/
RUN dotnet restore $(find . -name "*.csproj" -print -quit)

# 3. On publie en utilisant le même mécanisme de recherche
RUN dotnet publish $(find . -name "*.csproj" -print -quit) -c Release -o /app/publish

# Étape finale (Runtime)
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/publish .

# Configuration pour Render
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

# On lance l'application
# Remplace 'EstmApi.dll' par le nom exact de ton projet si différent
ENTRYPOINT ["dotnet", "EstmApi.dll"]