# Étape de Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# On copie le projet en spécifiant le chemin relatif
# Si ton fichier s'appelle EstmApi.csproj
COPY ["EstmApi.csproj", "./"]
RUN dotnet restore "EstmApi.csproj"

# Copier tout le reste du dossier EstmApi
COPY . .
RUN dotnet publish "EstmApi.csproj" -c Release -o /app/publish

# Étape finale
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/publish .

# Important pour Render : l'API doit écouter sur le port que Render lui donne
ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "EstmApi.dll"]