FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src

# Fetch deps
COPY EnoLandingPage.sln EnoLandingPage.sln
COPY EnoLandingPageBackend/EnoLandingPageBackend.csproj EnoLandingPageBackend/EnoLandingPageBackend.csproj
COPY EnoLandingPageCore/EnoLandingPageCore.csproj EnoLandingPageCore/EnoLandingPageCore.csproj
COPY EnoLandingPageFrontend/EnoLandingPageFrontend.csproj EnoLandingPageFrontend/EnoLandingPageFrontend.csproj
RUN dotnet restore

# Publish
COPY . .
RUN dotnet publish -c Release -o /app

# Copy to runtime container
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
EXPOSE 80
COPY --from=build /app .
<<<<<<< HEAD
COPY EnoLandingPageBackend/appsettings.json appsettings.json
=======
COPY EnoLandingPageBackend/appsettings.json .
>>>>>>> df44bb6... config cleanup
ENTRYPOINT ["dotnet", "EnoLandingPageBackend.dll"]
