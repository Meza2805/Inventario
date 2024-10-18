


--SELECT * FROM dbo.Producto
-- Declarar la tabla para los detalles de la compra
DECLARE @DetalleCompra dbo.DetalleCompraType;

-- Insertar los detalles de la compra relacionados con productos Apple
INSERT INTO @DetalleCompra (Id_Producto, Cantidad, Precio_Unitario)
VALUES 
    (25, 10, 2800), ----(Id Producto,Cantidad, Precio)
	(24, 13, 2800), ----(Id Producto,Cantidad, Precio)
	(23, 13, 2800), ----(Id Producto,Cantidad, Precio)
    (21, 6, 1600);  ----(Id Producto,Cantidad, Precio)

-- Declarar variable de resultado
DECLARE @Resultado INT;

-- Ejecutar el procedimiento
EXEC dbo.Sp_RegistrarCompra
    @Id_Proveedor = 12,  -- Proveedor con Id 12
    @DetalleCompra = @DetalleCompra,
    @Usuario_Crea = 'ADMIN',
    @Resultado = @Resultado OUTPUT;

-- Verificar el resultado
SELECT @Resultado;
