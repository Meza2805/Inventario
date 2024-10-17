using System;
using System.Collections.Generic;

namespace Punto_Venta_Inventario.Models;

public partial class Inventario
{
    public int IdInventario { get; set; }

    public int IdProducto { get; set; }

    public bool TipoMovimiento { get; set; }

    public int? Cantidad { get; set; }

    public string? UsuarioCrea { get; set; }

    public DateTime? FechaCreacion { get; set; }

    public string? UsuarioActualiza { get; set; }

    public DateTime? FechaActualizacion { get; set; }

    public bool? Estado { get; set; }

    public int? IdFacturaCompra { get; set; }

    public int? IdFacturaVenta { get; set; }

    public virtual Producto IdProductoNavigation { get; set; } = null!;
}
