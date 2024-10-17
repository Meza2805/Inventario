using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Punto_Venta_Inventario.Models;

namespace Punto_Venta_Inventario.Controllers
{
    public class ClientesController : Controller
    {
        private readonly PuntoVentaInventarioContext _context;

        public ClientesController(PuntoVentaInventarioContext context)
        {
            _context = context;
        }

        // GET: Clientes
        public async Task<IActionResult> Index()
        {
            return View(await _context.Clientes.ToListAsync());
        }

        // GET: Clientes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cliente = await _context.Clientes
                .FirstOrDefaultAsync(m => m.IdCliente == id);
            if (cliente == null)
            {
                return NotFound();
            }

            return View(cliente);
        }

        // GET: Clientes/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Clientes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdCliente,NoCedula,PrimerNombre,SegundoNombre,PrimerApellido,SegundoApellido,FechaNacimiento,Direccion,Telefono,Email,UsuarioCrea,FechaCreacion,UsuarioActualiza,FechaActualizacion,Estado")] Cliente cliente)
        {
            if (ModelState.IsValid)
            {
                _context.Add(cliente);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(cliente);
        }

        // GET: Clientes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cliente = await _context.Clientes.FindAsync(id);
            if (cliente == null)
            {
                return NotFound();
            }
            return View(cliente);
        }

        // POST: Clientes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdCliente,NoCedula,PrimerNombre,SegundoNombre,PrimerApellido,SegundoApellido,FechaNacimiento,Direccion,Telefono,Email,UsuarioCrea,FechaCreacion,UsuarioActualiza,FechaActualizacion,Estado")] Cliente cliente)
        {
            if (id != cliente.IdCliente)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(cliente);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ClienteExists(cliente.IdCliente))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(cliente);
        }

        // GET: Clientes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var cliente = await _context.Clientes
                .FirstOrDefaultAsync(m => m.IdCliente == id);
            if (cliente == null)
            {
                return NotFound();
            }

            return View(cliente);
        }

        // POST: Clientes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var cliente = await _context.Clientes.FindAsync(id);
            if (cliente != null)
            {
                _context.Clientes.Remove(cliente);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ClienteExists(int id)
        {
            return _context.Clientes.Any(e => e.IdCliente == id);
        }


        [HttpPost]
        public async Task<IActionResult> CrearCliente([FromBody] Registrar_Cliente model)
        {
            if (ModelState.IsValid)
            {
                var resultado = await _context.InsertarClienteAsync(model.NoCedula, model.PrimerNombre, model.SegundoNombre, model.PrimerApellido, model.SegundoApellido, model.FechaNacimiento, model.Direccion, model.Telefono, model.Email, model.UsuarioCrea);
                if (resultado == 1)
                {
                 
                    return Json(new { salida = resultado });
                }
                else if (resultado == 2)
                {
                    return Json(new { salida = resultado });
                }
                else
                {
                    return Json(new { salida = resultado });
                }
            }

            if (!ModelState.IsValid)
            {
                var errors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
              //  Puedes registrar los errores o mostrarlos
                Console.WriteLine(string.Join(", ", errors));

              //  Alternativamente, puedes devolver una respuesta de error en lugar de continuar
                return BadRequest(new { errores = errors });
            }


          //  Si llegamos aquí, algo falló, volver a mostrar el formulario
            return View(model);
        }
    }
}
