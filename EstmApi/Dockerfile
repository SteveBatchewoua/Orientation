# Étape de Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

COPY . .
RUN dotnet restore $(find . -name "*.csproj" -print -quit)
RUN dotnet publish $(find . -name "*.csproj" -print -quit) -c Release -o /app/publish

# Étape finale (Runtime)
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build /app/publish .

# --- SOLUTION AU PROBLÈME RÉSEAU ---
# Cette variable force .NET à ignorer l'IPv6 au niveau du moteur réseau
ENV DOTNET_SYSTEM_NET_DISABLE_IPV6=1
# -----------------------------------

ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "EstmApi.dll"]