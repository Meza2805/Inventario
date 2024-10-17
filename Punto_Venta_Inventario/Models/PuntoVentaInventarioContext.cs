using System;
using System.Collections.Generic;
using Microsoft.Data.SqlClient;
using System.Data;
using Microsoft.EntityFrameworkCore;

namespace Punto_Venta_Inventario.Models;

public partial class PuntoVentaInventarioContext : DbContext
{
    public PuntoVentaInventarioContext()
    {
    }

    public PuntoVentaInventarioContext(DbContextOptions<PuntoVentaInventarioContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Categorium> Categoria { get; set; }

    public virtual DbSet<Cliente> Clientes { get; set; }

    public virtual DbSet<Compra> Compras { get; set; }

    public virtual DbSet<DetalleCompra> DetalleCompras { get; set; }

    public virtual DbSet<DetalleVentum> DetalleVenta { get; set; }

    public virtual DbSet<Inventario> Inventarios { get; set; }

    public virtual DbSet<Marca> Marcas { get; set; }

    public virtual DbSet<Producto> Productos { get; set; }

    public virtual DbSet<Proveedor> Proveedors { get; set; }

    public virtual DbSet<Ventum> Venta { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=ConnectionStrings:ConexionPrincipal");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Categorium>(entity =>
        {
            entity.HasKey(e => e.IdCategoria).HasName("PK__Categori__CB903349579F1A38");

            entity.ToTable(tb => tb.HasTrigger("trg_PreventDeleteOnCategoria"));

            entity.Property(e => e.IdCategoria).HasColumnName("Id_Categoria");
            entity.Property(e => e.FechaActualizacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Actualizacion");
            entity.Property(e => e.FechaCreacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Creacion");
            entity.Property(e => e.UsuarioActualiza).HasColumnName("Usuario_Actualiza");
            entity.Property(e => e.UsuarioCrea).HasColumnName("Usuario_Crea");
        });

        modelBuilder.Entity<Cliente>(entity =>
        {
            entity.HasKey(e => e.IdCliente).HasName("PK__Cliente__3DD0A8CB8C723D82");

            entity.ToTable("Cliente", tb => tb.HasTrigger("trg_PreventDeleteOnCliente"));

            entity.Property(e => e.IdCliente).HasColumnName("Id_Cliente");
            entity.Property(e => e.FechaActualizacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Actualizacion");
            entity.Property(e => e.FechaCreacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Creacion");
            entity.Property(e => e.FechaNacimiento)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Nacimiento");
            entity.Property(e => e.NoCedula)
                .HasMaxLength(18)
                .HasColumnName("No_Cedula");
            entity.Property(e => e.PrimerApellido).HasColumnName("Primer_Apellido");
            entity.Property(e => e.PrimerNombre).HasColumnName("Primer_Nombre");
            entity.Property(e => e.SegundoApellido).HasColumnName("Segundo_Apellido");
            entity.Property(e => e.SegundoNombre).HasColumnName("Segundo_Nombre");
            entity.Property(e => e.Telefono).HasMaxLength(9);
            entity.Property(e => e.UsuarioActualiza).HasColumnName("Usuario_Actualiza");
            entity.Property(e => e.UsuarioCrea).HasColumnName("Usuario_Crea");
        });

        modelBuilder.Entity<Compra>(entity =>
        {
            entity.HasKey(e => e.IdCompra).HasName("PK__Compra__661E0ED06D8167FB");

            entity.ToTable("Compra", tb => tb.HasTrigger("trg_PreventDeleteOnCompra"));

            entity.Property(e => e.IdCompra).HasColumnName("Id_Compra");
            entity.Property(e => e.FechaCompra)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Compra");
            entity.Property(e => e.FechaCreacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Creacion");
            entity.Property(e => e.FechaModificacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Modificacion");
            entity.Property(e => e.IdProveedor).HasColumnName("Id_Proveedor");
            entity.Property(e => e.TotalCompra)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("Total_Compra");
            entity.Property(e => e.UsuarioCrea).HasColumnName("Usuario_Crea");
            entity.Property(e => e.UsuarioModifica).HasColumnName("Usuario_Modifica");

            entity.HasOne(d => d.IdProveedorNavigation).WithMany(p => p.Compras)
                .HasForeignKey(d => d.IdProveedor)
                .HasConstraintName("Compra_Id_Proveedor_fk");
        });

        modelBuilder.Entity<DetalleCompra>(entity =>
        {
            entity.HasKey(e => e.IdDetalleC).HasName("PK__Detalle___F07E4427AABD3526");

            entity.ToTable("Detalle_Compra", tb => tb.HasTrigger("trg_PreventDeleteOnDetalleCompra"));

            entity.Property(e => e.IdDetalleC).HasColumnName("Id_Detalle_C");
            entity.Property(e => e.FechaActualizacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Actualizacion");
            entity.Property(e => e.FechaCreacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Creacion");
            entity.Property(e => e.IdCompra).HasColumnName("Id_Compra");
            entity.Property(e => e.IdProducto).HasColumnName("Id_Producto");
            entity.Property(e => e.PrecioUnitario)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("Precio_Unitario");
            entity.Property(e => e.SubTotal).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.UsuarioActualiza).HasColumnName("Usuario_Actualiza");
            entity.Property(e => e.UsuarioCrea).HasColumnName("Usuario_Crea");

            entity.HasOne(d => d.IdCompraNavigation).WithMany(p => p.DetalleCompras)
                .HasForeignKey(d => d.IdCompra)
                .HasConstraintName("Detalle_Compra_Id_Compra_fk");

            entity.HasOne(d => d.IdProductoNavigation).WithMany(p => p.DetalleCompras)
                .HasForeignKey(d => d.IdProducto)
                .HasConstraintName("Detalle_Compra_Id_Producto_fk");
        });

        modelBuilder.Entity<DetalleVentum>(entity =>
        {
            entity.HasKey(e => e.IdDetalle).HasName("PK__Detalle___9274780B4B221690");

            entity.ToTable("Detalle_Venta");

            entity.Property(e => e.IdDetalle).HasColumnName("Id_Detalle");
            entity.Property(e => e.FechaActualizacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Actualizacion");
            entity.Property(e => e.FechaCreacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Creacion");
            entity.Property(e => e.IdProducto).HasColumnName("Id_Producto");
            entity.Property(e => e.IdVenta).HasColumnName("Id_Venta");
            entity.Property(e => e.PrecioUnitario)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("Precio_Unitario");
            entity.Property(e => e.SubTotal)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("Sub_Total");
            entity.Property(e => e.UsuarioActualiza).HasColumnName("Usuario_Actualiza");
            entity.Property(e => e.UsuarioCrea).HasColumnName("Usuario_Crea");

            entity.HasOne(d => d.IdProductoNavigation).WithMany(p => p.DetalleVenta)
                .HasForeignKey(d => d.IdProducto)
                .HasConstraintName("Venta_Detalle_Id_Producto_fk");

            entity.HasOne(d => d.IdVentaNavigation).WithMany(p => p.DetalleVenta)
                .HasForeignKey(d => d.IdVenta)
                .HasConstraintName("Venta_Detalle_Id_Venta_fk");
        });

        modelBuilder.Entity<Inventario>(entity =>
        {
            entity.HasKey(e => e.IdInventario).HasName("PK__Inventar__A9DB439C8B1DC34A");

            entity.ToTable("Inventario");

            entity.Property(e => e.IdInventario).HasColumnName("Id_Inventario");
            entity.Property(e => e.FechaActualizacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Actualizacion");
            entity.Property(e => e.FechaCreacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Creacion");
            entity.Property(e => e.IdFacturaCompra).HasColumnName("Id_Factura_Compra");
            entity.Property(e => e.IdFacturaVenta).HasColumnName("Id_Factura_Venta");
            entity.Property(e => e.IdProducto).HasColumnName("Id_Producto");
            entity.Property(e => e.TipoMovimiento).HasColumnName("Tipo_Movimiento");
            entity.Property(e => e.UsuarioActualiza).HasColumnName("Usuario_Actualiza");
            entity.Property(e => e.UsuarioCrea).HasColumnName("Usuario_Crea");

            entity.HasOne(d => d.IdProductoNavigation).WithMany(p => p.Inventarios)
                .HasForeignKey(d => d.IdProducto)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("Inventario_Id_Producto_fk");
        });

        modelBuilder.Entity<Marca>(entity =>
        {
            entity.HasKey(e => e.IdMarca).HasName("PK__Marca__28EFE28A5F706F07");

            entity.ToTable("Marca", tb => tb.HasTrigger("trg_PreventDeleteOnMarca"));

            entity.Property(e => e.IdMarca).HasColumnName("Id_Marca");
            entity.Property(e => e.FechaActualizacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Actualizacion");
            entity.Property(e => e.FechaCreacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Creacion");
            entity.Property(e => e.UsuarioActualiza).HasColumnName("Usuario_Actualiza");
            entity.Property(e => e.UsuarioCrea).HasColumnName("Usuario_Crea");
        });

        modelBuilder.Entity<Producto>(entity =>
        {
            entity.HasKey(e => e.IdProducto).HasName("PK__Producto__2085A9CF269AF7CC");

            entity.ToTable("Producto", tb => tb.HasTrigger("trg_PreventDeleteOnProducto"));

            entity.Property(e => e.IdProducto).HasColumnName("Id_Producto");
            entity.Property(e => e.CantidadInventario).HasColumnName("Cantidad_Inventario");
            entity.Property(e => e.FechaActualizacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Actualizacion");
            entity.Property(e => e.FechaCreacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Creacion");
            entity.Property(e => e.IdCategoria).HasColumnName("Id_Categoria");
            entity.Property(e => e.IdMarca).HasColumnName("Id_Marca");
            entity.Property(e => e.PrecioCosto)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("Precio_Costo");
            entity.Property(e => e.PrecioVenta)
                .HasColumnType("decimal(18, 0)")
                .HasColumnName("Precio_Venta");
            entity.Property(e => e.UsuarioActualiza).HasColumnName("Usuario_Actualiza");
            entity.Property(e => e.UsuarioCrea).HasColumnName("Usuario_Crea");

            entity.HasOne(d => d.IdCategoriaNavigation).WithMany(p => p.Productos)
                .HasForeignKey(d => d.IdCategoria)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("Producto_IdCategoria_fk");

            entity.HasOne(d => d.IdMarcaNavigation).WithMany(p => p.Productos)
                .HasForeignKey(d => d.IdMarca)
                .HasConstraintName("Producto_Id_Marca_fk");
        });

        modelBuilder.Entity<Proveedor>(entity =>
        {
            entity.HasKey(e => e.IdProveedor).HasName("PK__Proveedo__477B858E62DE3C36");

            entity.ToTable("Proveedor", tb => tb.HasTrigger("trg_PreventDeleteOnProveedor"));

            entity.Property(e => e.IdProveedor).HasColumnName("Id_Proveedor");
            entity.Property(e => e.FechaActualizacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Actualizacion");
            entity.Property(e => e.FechaCreacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Creacion");
            entity.Property(e => e.UsuarioActualiza).HasColumnName("Usuario_Actualiza");
            entity.Property(e => e.UsuarioCrea).HasColumnName("Usuario_Crea");
        });

        modelBuilder.Entity<Ventum>(entity =>
        {
            entity.HasKey(e => e.IdVenta).HasName("PK__Venta__B3C9EABD7AC69C82");

            entity.Property(e => e.IdVenta).HasColumnName("Id_Venta");
            entity.Property(e => e.FechaActualizacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Actualizacion");
            entity.Property(e => e.FechaCreacion)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Creacion");
            entity.Property(e => e.FechaVenta)
                .HasColumnType("datetime")
                .HasColumnName("Fecha_Venta");
            entity.Property(e => e.IdCliente).HasColumnName("Id_Cliente");
            entity.Property(e => e.Total).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.UsuarioActualiza).HasColumnName("Usuario_Actualiza");
            entity.Property(e => e.UsuarioCrea).HasColumnName("Usuario_Crea");

            entity.HasOne(d => d.IdClienteNavigation).WithMany(p => p.Venta)
                .HasForeignKey(d => d.IdCliente)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("Venta_Id_Cliente_fk");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);



    ////Para Manejar los procedmientos Almacenados
    ///


    ///Procedimiento Almacenado para Insertar Producto  EXEC dbo.Sp_InsertarProducto
    public async Task<int> InsertarProductoAsync(int idCategoria, int idMarca, string nombre, string descripcion, string modelo, decimal precioVenta, decimal precioCosto, string usuarioCrea)
    {
        // Parámetros para el procedimiento almacenado
        var idCategoriaParam = new SqlParameter("@Id_Categoria", idCategoria);
        var idMarcaParam = new SqlParameter("@Id_Marca", idMarca);
        var nombreParam = new SqlParameter("@Nombre", nombre);
        var descripcionParam = new SqlParameter("@Descripcion", descripcion);
        var modeloParam = new SqlParameter("@Modelo", modelo);
        var precioVentaParam = new SqlParameter("@Precio_Venta", precioVenta);
        var precioCostoParam = new SqlParameter("@Precio_Costo", precioCosto);
        var usuarioCreaParam = new SqlParameter("@Usuario_Crea", usuarioCrea);

        // Parámetro de salida
        var resultadoParam = new SqlParameter("@Resultado", SqlDbType.Int)
        {
            Direction = ParameterDirection.Output
        };

        // Llamada al procedimiento almacenado
        await Database.ExecuteSqlRawAsync("EXEC dbo.Sp_InsertarProducto @Id_Categoria, @Id_Marca, @Nombre, @Descripcion, @Modelo, @Precio_Venta, @Precio_Costo, @Usuario_Crea, @Resultado OUTPUT",
            idCategoriaParam, idMarcaParam, nombreParam, descripcionParam, modeloParam, precioVentaParam, precioCostoParam, usuarioCreaParam, resultadoParam);

        // Devolver el resultado
        return (int)resultadoParam.Value;
    }


}
