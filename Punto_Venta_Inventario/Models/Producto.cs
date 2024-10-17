using System;
using System.Collections.Generic;

namespace Punto_Venta_Inventario.Models;

public partial class Producto
{
    public int IdProducto { get; set; }

    public int IdCategoria { get; set; }

    public int? IdMarca { get; set; }

    public string? Nombre { get; set; }

    public string? Descripcion { get; set; }

    public string? Modelo { get; set; }

    public decimal PrecioVenta { get; set; }

    public decimal PrecioCosto { get; set; }

    public int? CantidadInventario { get; set; }

    public string? UsuarioCrea { get; set; }

    public DateTime? FechaCreacion { get; set; }

    public string? UsuarioActualiza { get; set; }

    public DateTime? FechaActualizacion { get; set; }

    public bool? Estado { get; set; }

    public virtual ICollection<DetalleCompra> DetalleCompras { get; set; } = new List<DetalleCompra>();

    public virtual ICollection<DetalleVentum> DetalleVenta { get; set; } = new List<DetalleVentum>();

    public virtual Categorium IdCategoriaNavigation { get; set; } = null!;

    public virtual Marca? IdMarcaNavigation { get; set; }

    public virtual ICollection<Inventario> Inventarios { get; set; } = new List<Inventario>();
}
