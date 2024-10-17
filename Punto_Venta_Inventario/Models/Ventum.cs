using System;
using System.Collections.Generic;

namespace Punto_Venta_Inventario.Models;

public partial class Ventum
{
    public int IdVenta { get; set; }

    public int IdCliente { get; set; }

    public DateTime FechaVenta { get; set; }

    public decimal Total { get; set; }

    public string? UsuarioCrea { get; set; }

    public DateTime? FechaCreacion { get; set; }

    public string? UsuarioActualiza { get; set; }

    public DateTime? FechaActualizacion { get; set; }

    public bool? Estado { get; set; }

    public virtual ICollection<DetalleVentum> DetalleVenta { get; set; } = new List<DetalleVentum>();

    public virtual Cliente IdClienteNavigation { get; set; } = null!;
}
