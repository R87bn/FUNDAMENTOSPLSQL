
-- FUNDAMENTOS JAVA
-- 1
-- CALCULAR DIA DE NACIMIENTO DE LA SEMANA
-- Pedir una fecha al usuario para calcular el día de la semana que nació. Tenemos que tener
-- la
-- tabla de días de la semana para la correspondencia comenzando en sábado:
-- Debemos tener el día, el número de mes y el año que el usuario haya nacido.
-- A partir de
-- esto datos hay que calcular lo siguiente para averiguar el día de la semana de
-- nacimiento:
-- Ejemplo
-- 
-- 22/06/1983
-- Hay que tener en cuenta el mes para realizar el cálculo, si el mes es Enero, el Mes será 13 y
-- restaremos uno al año. Si el Mes es Febrero, el
-- Mes será 14 y restaremos uno al año.
-- Para poder calcular el número final de la semana debemos seguir los siguientes pasos:
-- 1.
-- Multiplicar el Mes más 1 por 3 y dividirlo entre 5
-- ((6
-- + 1) * 3) / 5
-- 
-- 4
-- 2.
-- Dividir el año entre 4
-- 1983 / 4
-- 
-- 495
-- 3.
-- Dividir el
-- año entre 100
-- 1983 / 100
-- 
-- 19
-- 4.
-- Dividir el año entre 400
-- 1983 / 400
-- 
-- 4
-- 5.
-- Sumar el dia, el doble del mes, el año, el resultado de la operación 1, el resultado de
-- la operación 2, menos el resultado de la operación 3 más la operación 4 más 2.
-- 22 + (6 * 2) + 1983 + 4 + 495
-- -
-- 19 + 4 + 2
-- 
-- 2503
-- 6.
-- Dividir el resultado anterior entre 7.
-- 2503 / 7
-- 
-- 357
-- 7.
-- Restar el número del paso 5 con el número del paso 6 por 7.
-- 2503
-- –
-- (357 * 7)
-- 
-- 4
-- 8.
-- Miramos la tabla y vemos que el número 4 corresponde a
-- Miércoles

DECLARE
    dia int :=&dia;
    mes int :=&mes;
    ano int :=&ano;
BEGIN
    if mes = 1 THEN
    mes = 13, ano = (ano -1);
    (mes + 1) * 3 / 4;