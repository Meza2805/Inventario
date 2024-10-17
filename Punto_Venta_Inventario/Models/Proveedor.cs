using System;
using System.Collections.Generic;

namespace Punto_Venta_Inventario.Models;

public partial class Proveedor
{
    public int IdProveedor { get; set; }

    public string? Nombre { get; set; }

    public string? Contacto { get; set; }

    public string? Telefono { get; set; }

    public string? Direccion { get; set; }

    public string? UsuarioCrea { get; set; }

    public DateTime? FechaCreacion { get; set; }

    public string? UsuarioActualiza { get; set; }

    public DateTime? FechaActualizacion { get; set; }

    public bool? Estado { get; set; }

    public virtual ICollection<Compra> Compras { get; set; } = new List<Compra>();
}
