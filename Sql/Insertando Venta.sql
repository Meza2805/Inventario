
SELECT * FROM dbo.Cliente
SELECT * FROM dbo.Inventario

-- Declarar la tabla para los detalles de la venta
DECLARE @DetalleVenta DetalleCompraType;

-- Insertar los detalles de la venta (3 productos)
INSERT INTO @DetalleVenta (Id_Producto, Cantidad,Precio_Unitario)
VALUES 
    (4, 2,0),  -- Producto IPHONE 14, 2 unidades, precio 1200
    (5, 1,0),  -- Producto GALAXY S22, 1 unidad, precio 1000
    (7, 3,0);   -- Producto HUAWEI P50, 3 unidades, precio 900

-- Declarar la variable de resultado
DECLARE @Resultado INT;

-- Ejecutar el procedimiento almacenado para registrar la venta
EXEC dbo.Sp_RegistrarVenta
    @Id_Cliente = 1,                -- Suponiendo que el Id del cliente es 1
    @DetalleVenta = @DetalleVenta,   -- Tabla de detalle de venta
    @Usuario_Crea = 'ADMIN',         -- Usuario que realiza la venta
    @Resultado = @Resultado OUTPUT;  -- Variable de salida para el resultado

-- Verificar el resultado
SELECT @Resultado;
