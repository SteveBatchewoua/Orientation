# Étape de Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# On copie toute la solution/le contexte
# Render envoie tout le repo, donc on accède au sous-dossier
COPY . .

# On restaure en pointant explicitement vers le projet dans le sous-dossier
# Note : Si ton projet est à la racine, enlève "EstmApi/"
RUN dotnet restore "./EstmApi.csproj"

# On publie
RUN dotnet publish "./EstmApi.csproj" -c Release -o /out

# Étape finale (Runtime)
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /out .

# Configuration pour Render
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

# Assure-toi que le nom de la DLL est correct (EstmApi.dll)
ENTRYPOINT ["dotnet", "EstmApi.dll"]