using System;
using System.Collections.Generic;

namespace Punto_Venta_Inventario.Models;

public partial class Categorium
{
    public int IdCategoria { get; set; }

    public string? Nombre { get; set; }

    public string? Descripcion { get; set; }

    public string? UsuarioCrea { get; set; }

    public DateTime? FechaCreacion { get; set; }

    public string? UsuarioActualiza { get; set; }

    public DateTime? FechaActualizacion { get; set; }

    public bool? Estado { get; set; }

    public virtual ICollection<Producto> Productos { get; set; } = new List<Producto>();
}
