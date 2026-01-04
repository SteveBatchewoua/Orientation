using Microsoft.EntityFrameworkCore;
using EstmApi.Data;
using EstmApi.Models;

var builder = WebApplication.CreateBuilder(args);

// 1. Configuration de la base de données PostgreSQL
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseNpgsql(connectionString));

// 2. Activation du CORS pour Angular (Port 4200 par défaut)
builder.Services.AddCors(options =>
{
    options.AddPolicy("AngularApp", policy =>
        //policy.WithOrigins("http://localhost:4200")
        policy.WithOrigins("https://orientation-ep1n.vercel.app")
        
              .AllowAnyMethod()
              .AllowAnyHeader());
});
AppContext.SetSwitch("Npgsql.EnableIPv6", false);
var app = builder.Build();

app.UseCors("AngularApp");

// --- ENDPOINTS MINIMAL API ---

// Recherche globale filtrée
app.MapGet("/api/discovery/search", async (string? q, ItemType? type, string? institution, AppDbContext db) =>
{
    var queryable = db.DiscoveryItems.AsQueryable();

    if (type.HasValue)
        queryable = queryable.Where(x => x.Type == type.Value);

    if (!string.IsNullOrEmpty(institution) && institution != "Toutes")
        queryable = queryable.Where(x => x.Institution == institution);

    if (!string.IsNullOrEmpty(q))
    {
        var term = q.ToLower();
        queryable = queryable.Where(x => 
            EF.Functions.ILike(x.Title, $"%{term}%") || 
            EF.Functions.ILike(x.Domain, $"%{term}%"));
    }

    return Results.Ok(await queryable.OrderBy(x => x.Title).ToListAsync());
});

// Récupérer la liste des universités pour les filtres Angular
app.MapGet("/api/discovery/institutions", async (AppDbContext db) =>
{
    var institutions = await db.DiscoveryItems
        .Select(x => x.Institution)
        .Distinct()
        .ToListAsync();
    return Results.Ok(institutions);
});

// Détails d'un item spécifique
app.MapGet("/api/discovery/{id:int}", async (int id, AppDbContext db) =>
    await db.DiscoveryItems.FindAsync(id) is DiscoveryItem item 
        ? Results.Ok(item) 
        : Results.NotFound());

app.Run();