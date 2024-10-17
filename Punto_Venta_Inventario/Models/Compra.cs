using System;
using System.Collections.Generic;

namespace Punto_Venta_Inventario.Models;

public partial class Compra
{
    public int IdCompra { get; set; }

    public int? IdProveedor { get; set; }

    public DateTime? FechaCompra { get; set; }

    public decimal? TotalCompra { get; set; }

    public string? UsuarioCrea { get; set; }

    public DateTime? FechaCreacion { get; set; }

    public string? UsuarioModifica { get; set; }

    public DateTime? FechaModificacion { get; set; }

    public bool? Estado { get; set; }

    public virtual ICollection<DetalleCompra> DetalleCompras { get; set; } = new List<DetalleCompra>();

    public virtual Proveedor? IdProveedorNavigation { get; set; }
}
