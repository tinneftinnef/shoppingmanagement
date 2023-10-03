using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace ShoppingManagementWeb.Models
{
    public partial class ShoppingManagementContext : DbContext
    {
        public ShoppingManagementContext()
        {
        }

        public ShoppingManagementContext(DbContextOptions<ShoppingManagementContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ProductCategory> ProductCategories { get; set; } = null!;
        public virtual DbSet<Production> Productions { get; set; } = null!;
        public virtual DbSet<Registation> Registations { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<Wallet> Wallets { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var config = new ConfigurationBuilder()
                                .AddJsonFile("appsettings.json")
                                .Build();

            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(config.GetConnectionString("value"));
            }

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ProductCategory>(entity =>
            {
                entity.HasKey(e => e.ProductCateId)
                    .HasName("product_categories_product_cate_id_primary");

                entity.ToTable("Product_Categories");

                entity.Property(e => e.ProductCateId)
                    .ValueGeneratedNever()
                    .HasColumnName("product_cate_id");

                entity.Property(e => e.CateName)
                    .HasMaxLength(255)
                    .HasColumnName("cate_name");
            });

            modelBuilder.Entity<Production>(entity =>
            {
                entity.HasKey(e => e.ProductId)
                    .HasName("production_product_id_primary");

                entity.ToTable("Production");

                entity.Property(e => e.ProductId)
                    .ValueGeneratedNever()
                    .HasColumnName("product_id");

                entity.Property(e => e.ProductCategoryId).HasColumnName("product_category_id");

                entity.Property(e => e.ProductInformation)
                    .HasMaxLength(255)
                    .HasColumnName("product_information");

                entity.Property(e => e.ProductListPrice).HasColumnName("product_list_price");

                entity.Property(e => e.ProductName)
                    .HasMaxLength(255)
                    .HasColumnName("product_name");

                entity.Property(e => e.ProductQuantity).HasColumnName("product_quantity");

                entity.Property(e => e.ProductSalePrice).HasColumnName("product_sale_price");

                entity.HasOne(d => d.ProductCategory)
                    .WithMany(p => p.Productions)
                    .HasForeignKey(d => d.ProductCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("production_product_category_id_foreign");
            });

            modelBuilder.Entity<Registation>(entity =>
            {
                entity.HasKey(e => e.RegistrationId)
                    .HasName("registation_registration_id_primary");

                entity.ToTable("Registation");

                entity.Property(e => e.RegistrationId)
                    .ValueGeneratedNever()
                    .HasColumnName("registration_id");

                entity.Property(e => e.ProductId).HasColumnName("product_id");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.Property(e => e.TotalMoney).HasColumnName("totalMoney");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Registations)
                    .HasForeignKey(d => d.ProductId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("registation_product_id_foreign");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Registations)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("registation_user_id_foreign");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.UserId)
                    .ValueGeneratedNever()
                    .HasColumnName("user_id");

                entity.Property(e => e.Address)
                    .HasMaxLength(255)
                    .HasColumnName("address");

                entity.Property(e => e.Email)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("email");

                entity.Property(e => e.FullName)
                    .HasMaxLength(255)
                    .HasColumnName("full_name");

                entity.Property(e => e.Password)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("password");

                entity.Property(e => e.Roles).HasColumnName("roles");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.Username)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("username");
            });

            modelBuilder.Entity<Wallet>(entity =>
            {
                entity.ToTable("Wallet");

                entity.Property(e => e.WalletId)
                    .ValueGeneratedNever()
                    .HasColumnName("wallet_id");

                entity.Property(e => e.LastMoneyIn).HasColumnName("last_money_in");

                entity.Property(e => e.LastTimePushMoney)
                    .HasColumnType("date")
                    .HasColumnName("last_time_push_money");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Wallets)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("wallet_user_id_foreign");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
