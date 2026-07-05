# SQL Select Fundamentals

## ¿Por qué es mala práctica usar SELECT * en producción?

Usar `SELECT *` en producción no es recomendable porque:

- Trae todas las columnas, incluso las que no se necesitan, haciendo la consulta más lenta.
- Si la tabla cambia y se agregan nuevas columnas, la consulta puede traer información innecesaria o sensible.

Por eso, es una buena práctica seleccionar únicamente las columnas que realmente se van a utilizar.

## ¿Por qué son importantes los alias para un stakeholder no técnico?

Los alias permiten mostrar nombres de columnas más claros y fáciles de entender.

Por ejemplo, en lugar de mostrar una columna llamada `total_amount`, podemos utilizar un alias:

```sql
SELECT total_amount AS monto_total
FROM sales;
```

De esta forma, una persona del área de Finanzas entiende inmediatamente qué representa esa columna sin necesidad de conocer los nombres técnicos de la base de datos.
