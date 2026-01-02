using Microsoft.EntityFrameworkCore;
using EstmApi.Models;

namespace EstmApi.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    // La table principale pour les métiers et formations
    public DbSet<DiscoveryItem> DiscoveryItems => Set<DiscoveryItem>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // Configuration de l'entité DiscoveryItem
        modelBuilder.Entity<DiscoveryItem>(entity =>
        {
            // Conversion de l'Enum ItemType (Metier/Formation) en Entier (0/1) 
            // pour une compatibilité parfaite avec PostgreSQL
            entity.Property(e => e.Type)
                .HasConversion<int>()
                .IsRequired();

            // Indexation pour accélérer les recherches sur le titre et l'institution
            entity.HasIndex(e => e.Title);
            entity.HasIndex(e => e.Institution);
            
            // Configuration des longueurs de champs (Best practice Production)
            entity.Property(e => e.Title).HasMaxLength(255).IsRequired();
            entity.Property(e => e.Institution).HasMaxLength(200).IsRequired();
            entity.Property(e => e.Domain).HasMaxLength(150);
            entity.Property(e => e.Location).HasMaxLength(100);
        });
    }
}