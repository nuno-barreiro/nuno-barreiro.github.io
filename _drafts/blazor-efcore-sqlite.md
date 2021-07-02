---
title: Monoliths vs Micro-services
date: 2021-03-23 09:00:00 +0000
categories: web-development programming
tags: blazor ef-core sqlite 
published: false
---




Create a Database class library and add a reference to the EntityFramework.Core.Design NuGet package.

```bash
dotnet ef-core migrations add InitialMigration --project SqliteBlazor.Database\SqliteBlazor.Database.csproj
```
