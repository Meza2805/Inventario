﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Punto_Venta_Inventario.Models;

namespace Punto_Venta_Inventario.Controllers
{
    public class ProductoesController : Controller
    {
        private readonly PuntoVentaInventarioContext _context;

        public ProductoesController(PuntoVentaInventarioContext context)
        {
            _context = context;
        }

        // GET: Productoes
        public async Task<IActionResult> Index()
        {
            var puntoVentaInventarioContext = _context.Productos.Include(p => p.IdCategoriaNavigation).Include(p => p.IdMarcaNavigation);
            return View(await puntoVentaInventarioContext.ToListAsync());
        }

        // GET: Productoes/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var producto = await _context.Productos
                .Include(p => p.IdCategoriaNavigation)
                .Include(p => p.IdMarcaNavigation)
                .FirstOrDefaultAsync(m => m.IdProducto == id);
            if (producto == null)
            {
                return NotFound();
            }

            return View(producto);
        }

        // GET: Productoes/Create
        public IActionResult Create()
        {
            ViewData["IdCategoria"] = new SelectList(_context.Categoria, "IdCategoria", "IdCategoria");
            ViewData["IdMarca"] = new SelectList(_context.Marcas, "IdMarca", "IdMarca");
            return View();
        }

        // POST: Productoes/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdProducto,IdCategoria,IdMarca,Nombre,Descripcion,Modelo,PrecioVenta,PrecioCosto,CantidadInventario,UsuarioCrea,FechaCreacion,UsuarioActualiza,FechaActualizacion,Estado")] Producto producto)
        {
            if (ModelState.IsValid)
            {
                _context.Add(producto);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdCategoria"] = new SelectList(_context.Categoria, "IdCategoria", "IdCategoria", producto.IdCategoria);
            ViewData["IdMarca"] = new SelectList(_context.Marcas, "IdMarca", "IdMarca", producto.IdMarca);
            return View(producto);
        }

        // GET: Productoes/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var producto = await _context.Productos.FindAsync(id);
            if (producto == null)
            {
                return NotFound();
            }
            ViewData["IdCategoria"] = new SelectList(_context.Categoria, "IdCategoria", "IdCategoria", producto.IdCategoria);
            ViewData["IdMarca"] = new SelectList(_context.Marcas, "IdMarca", "IdMarca", producto.IdMarca);
            return View(producto);
        }

        // POST: Productoes/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdProducto,IdCategoria,IdMarca,Nombre,Descripcion,Modelo,PrecioVenta,PrecioCosto,CantidadInventario,UsuarioCrea,FechaCreacion,UsuarioActualiza,FechaActualizacion,Estado")] Producto producto)
        {
            if (id != producto.IdProducto)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(producto);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductoExists(producto.IdProducto))
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
            ViewData["IdCategoria"] = new SelectList(_context.Categoria, "IdCategoria", "IdCategoria", producto.IdCategoria);
            ViewData["IdMarca"] = new SelectList(_context.Marcas, "IdMarca", "IdMarca", producto.IdMarca);
            return View(producto);
        }

        // GET: Productoes/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var producto = await _context.Productos
                .Include(p => p.IdCategoriaNavigation)
                .Include(p => p.IdMarcaNavigation)
                .FirstOrDefaultAsync(m => m.IdProducto == id);
            if (producto == null)
            {
                return NotFound();
            }

            return View(producto);
        }

        // POST: Productoes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var producto = await _context.Productos.FindAsync(id);
            if (producto != null)
            {
                _context.Productos.Remove(producto);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductoExists(int id)
        {
            return _context.Productos.Any(e => e.IdProducto == id);
        }

        [HttpPost]
        public async Task<IActionResult> CrearProducto([FromBody]  RegistrarProducto model)
            {
            if (ModelState.IsValid)
            {
                var resultado = await _context.InsertarProductoAsync(model.IdCategoria, (int)model.IdMarca, model.Nombre, model.Descripcion, model.Modelo, model.PrecioVenta, model.PrecioCosto, model.UsuarioCrea);
                if (resultado == 1)
                {
                    //return RedirectToAction("Index"); // Redirigir si fue exitoso
                                                      // Devolver el resultado en formato JSON
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
                // Puedes registrar los errores o mostrarlos
                Console.WriteLine(string.Join(", ", errors));

                // Alternativamente, puedes devolver una respuesta de error en lugar de continuar
                return BadRequest(new { errores = errors });
            }


            // Si llegamos aquí, algo falló, volver a mostrar el formulario
            return View(model);
        }

    }
}
