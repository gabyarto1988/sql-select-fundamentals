-- ============================================
-- Módulo 4 - Consultas de Negocio
-- Alumna: Gaby
-- Base de datos: SistemaVentas
-- ============================================


-- ============================================
-- CONSULTA 1
-- Resumen ejecutivo mensual
-- ============================================

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(*) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);


-- ============================================
-- CONSULTA 2
-- Top 5 productos por facturación
-- ============================================

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY total_facturado DESC;


-- ============================================
-- CONSULTA 3
-- Clientes recurrentes
-- ============================================

SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;


-- ============================================
-- CONSULTA 4
-- Meses por encima o debajo del promedio
-- ============================================

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,

    CASE
        WHEN SUM(cantidad * precio_unitario) >
        (
            SELECT AVG(total_mes)
            FROM
            (
                SELECT SUM(cantidad * precio_unitario) AS total_mes
                FROM ventas
                GROUP BY MONTH(fecha_venta)
            ) AS promedio
        )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion

FROM ventas
GROUP BY MONTH(fecha_venta);


-- ============================================
-- HALLAZGOS
-- ============================================

-- 1. El mes 1 presenta la mayor facturación del período analizado.
-- 2. El producto 301 es el que genera el mayor ingreso total.
-- 3. Los clientes 201, 202, 203, 204 y 205 realizaron más de un pedido.
