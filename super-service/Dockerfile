# Use the official .NET Core SDK image to build the application
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build

# Set the working directory in the container for the build stage
WORKDIR /app

# Copy the .csproj file and restore the dependencies
COPY src/SuperService.csproj ./src/
RUN dotnet restore ./src/SuperService.csproj

# Copy the entire source code
COPY src/ ./src/

# Build the application
RUN dotnet publish ./src/SuperService.csproj -c Release -o /app/out

# Use the official .NET Core runtime image to run the application
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1

# Set the working directory in the container for the runtime stage
WORKDIR /app

# Copy the built application from the build image
COPY --from=build /app/out .

# Expose the port the app runs on
EXPOSE 80

# Define the entry point for the container to run the application
ENTRYPOINT ["dotnet", "SuperService.dll"]
