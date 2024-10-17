using System;
using System.Collections.Generic;

namespace Punto_Venta_Inventario.Models;

public partial class DetalleCompra
{
    public int IdDetalleC { get; set; }

    public int? IdCompra { get; set; }

    public int? IdProducto { get; set; }

    public int? Cantidad { get; set; }

    public decimal? PrecioUnitario { get; set; }

    public decimal? SubTotal { get; set; }

    public string? UsuarioCrea { get; set; }

    public DateTime? FechaCreacion { get; set; }

    public string? UsuarioActualiza { get; set; }

    public DateTime? FechaActualizacion { get; set; }

    public bool? Estado { get; set; }

    public virtual Compra? IdCompraNavigation { get; set; }

    public virtual Producto? IdProductoNavigation { get; set; }
}
