


using System;
using System.Collections.Generic;

namespace Punto_Venta_Inventario.Models;

public class Registrar_Cliente
{

    public string NoCedula { get; set; }

    public string PrimerNombre { get; set; }

    public string SegundoNombre { get; set; }

    public string PrimerApellido { get; set; }

    public string SegundoApellido { get; set; }

    public DateTime FechaNacimiento { get; set; }

    public string Direccion { get; set; }

    public string Telefono { get; set; }

    public string Email { get; set; }

    public string UsuarioCrea { get; set; }

    public DateTime FechaCreacion { get; set; }

    public string UsuarioActualiza { get; set; }

    public DateTime FechaActualizacion { get; set; }

    public bool Estado { get; set; }
}
