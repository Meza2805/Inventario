using System;
using System.Collections.Generic;

namespace Punto_Venta_Inventario.Models
{
    public class RegistrarProducto
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
      

    }
}
