/*EXCEPCIONES!!!DENTRO DEL BLOQUE BEGIN-END
SIEMPRE QUE DA UN ERROR EL PROGRAMA SE INTERRUMPE
-1 SI SE PRODUCE UNA OP ILEGAL /0
-2 PROVOCAR LA EXCEPCIÓN 
-OTHERS CUALQUIE OTRA
 HAY IMPLICITAS (DE ORACLE)
     EXPLÍCITAS (PROPIAS CREADAS)
*/

--CAPTURAR UNA EXCEPCIÓN DEL SISTEMA
/
DECLARE
    v_numero1 number := '&numero1';
    v_numero2 number := '&numero2';
    v_division number;
BEGIN
    v_division := v_numero1 / v_numero2;
    DBMS_OUTPUT.PUT_LINE('El resultado es ' || v_division);
END;
/

undefine numero1;
undefine numero2;

------------AÑADIMOS LA EXCEPCIÓN

/
DECLARE
    v_numero1 number := '&numero1';
    v_numero2 number := '&numero2';
    v_division number;
BEGIN
    v_division := v_numero1 / v_numero2;
    DBMS_OUTPUT.PUT_LINE('El resultado es ' || v_division);
exception
    when ZERO_DIVIDE then --zero divide excepción propia de oracle (implícita)
        DBMS_OUTPUT.PUT_LINE('Error al dividir entre 0');
END;
/

--CUANDO LOS EMPLEADOS TENGAN UNA COMOSIÓN = 0 LANZAREMOS UNA EXCEPCIÓN
--TENDREMOS UNA TABLA CON LOS EMP CON COMOISIÓN >0

select apellido, comision from emp order by comision desc;--vemos los emp sin comisio n primeropara crear esta tabla:

create table emp_comision (
    apellido varchar2(50),
    comision number(9));
----------------------------------------------RECORREMOS LA TABLA CON EL LOOP Y EL SELECT
DECLARE             
    cursor cursor_emp is
    select apellido, comision from emp order by comision desc;
BEGIN
        for v_record in cursor_emp
        loop
            DBMS_OUTPUT.PUT_LINE('Apellido' || v_record.APELLIDO || ' Comisión ' || v_record.comision);
        end loop;
END;

------AÑADIMOS LA EXCEPCIÓN CUANDO LA COMISIÓN SEA 0
DECLARE
    CURSOR cursor_emp IS
        SELECT apellido, comision
          FROM emp
         ORDER BY comision DESC;

    exception_comision EXCEPTION;
BEGIN
    FOR v_record IN cursor_emp LOOP
        DBMS_OUTPUT.PUT_LINE(
          'Apellido: ' || v_record.apellido ||
          ' — Comisión: ' || v_record.comision
        );

        -- Comprueba aquí mismo si la comisión es cero
        IF v_record.comision = 0 THEN
            RAISE exception_comision;
        END IF;
    END LOOP;

EXCEPTION
    WHEN exception_comision THEN
        DBMS_OUTPUT.PUT_LINE(
          '¡Error! Se encontró un empleado sin comisión.'
        );
END;
/

---PRAGMA EXCEPTIONS. PRIMERO HACEMOS UN BLOQUE PARA FORZARLA

--nuesztra tabla está mal, hemos añadido registros null, vamos a borrarlos y arregrlarolos,
-- para luego añadir la pk o no permitir nulos

desc dept;
select * from dept;
-------borramos los dept null
DELETE FROM DEPT WHERE DEPT_NO IS NULL;

ALTER TABLE DEPT
MODIFY DEPT_NO NUMBER NOT NULL;

ALTER TABLE DEPT
ADD CONSTRAINT pk_dept PRIMARY KEY (DEPT_NO);


DECLARE
    exception_nulos EXCEPTION;
    PRAGMA EXCEPTION_INIT(exception_nulos, -1400);

BEGIN
    insert into DEPT values (null, 'DEPARTAMENTO', 'PRAGMA');
exception   
    when exception_nulos then 
        DBMS_OUTPUT.PUT_LINE('No me sirven los nulos');
END;







--EJEMPLO PROCEDIMIENTO PARA MOSTRAR UN MENSAJE
--STORED PROCEDURE

create or replace procedure sp_mensaje
as   
begin 
    --mostramos un mensaje
    DBMS_OUTPUT.PUT_LINE('Hoy es jueves');
end;

--LLAMADA AL PROCEDIMIENTO
begin   
    sp_mensaje;
end;

---PROCEDIMIENTO CON BLOQUE PLSQL
declare 
    v_numero number :=14;
begin 
    if v_numero > 0 then
        DBMS_OUTPUT.PUT_LINE('Positivo');
    else 
        DBMS_OUTPUT.PUT_LINE('Negativo');
    end if;
 end;

-----------CREAMOS EL PROCEDIMIENTO--------
CREATE OR REPLACE PROCEDURE sp_ejemplo_plsql
AS
    v_numero NUMBER := 14;
BEGIN
    IF v_numero > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Positivo');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Negativo');
    END IF;
----------ejecutampos y llamamos
begin 
    sp_ejemplo_plsql1;
end;

---------SINTAXIS PARA TENER VARIABLES DENTRO DE UN PORCEDIMIENTO
---NO SE UTILIZA DECLARE

create or replace procedure sp_ejemplo_plsql2
as   
    v_numero number :=14;
begin
    IF v_numero > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Positivo');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Negativo');
    END IF;
end;

begin 
    sp_ejemplo_plsql2;
end;
 
---PROCEDIMIENTO PARA SUMAR DOS NUMEROS

create or replace procedure sp_sumar_numeros(
    p_numero1 number, p_numero2 number)
as 
    v_suma number;
begin
    v_suma := p_numero1 + p_numero2;
    DBMS_OUTPUT.PUT_LINE('La suma de ' || p_numero1 || ' + '  || p_numero2 || ' es igual a ' || v_suma);
end;

begin 
    sp_sumar_numeros (5,6);
end;

----procedimiento paradividir dos numeros
--sp_dividir_numeros

create or replace procedure sp_dividir_numeros(
        p_numero1 number, p_numero2 number)
as   
    v_dividir number;
begin
    v_dividir := p_numero1 / p_numero2;
    DBMS_OUTPUT.PUT_LINE('La división' || p_numero1 || ' / '  || p_numero2 || ' es igual a ' || v_dividir);
end;

begin 
    sp_dividir_numeros (12,-1);
end;

--
begin 
    sp_dividir_numeros (12,0);
end;
--si pones int en v_dividir te trunca el resultado
--si dividimos entre 0, sale error, añadimos una exception


create or replace procedure sp_dividir_numeros(
        p_numero1 number, p_numero2 number)
as   
    v_dividir number;
begin
    v_dividir := p_numero1 / p_numero2;
    DBMS_OUTPUT.PUT_LINE('La división' || p_numero1 || ' / '  || p_numero2 || ' es igual a ' || v_dividir);
exception 
    when ZERO_DIVIDE then
        DBMS_OUTPUT.PUT_LINE('División entre cero PROCEDURE');

        
end;

-------ejecutamos de nuevo y comprobamos

begin 
    sp_dividir_numeros (12,0);
end;
--------------------


create or replace procedure sp_dividir_numeros(
        p_numero1 number, p_numero2 number)
as   
    v_dividir number;
begin
    v_dividir := p_numero1 / p_numero2;
    DBMS_OUTPUT.PUT_LINE('La división' || p_numero1 || ' / '  || p_numero2 || ' es igual a ' || v_dividir);
exception 
    when ZERO_DIVIDE then
        DBMS_OUTPUT.PUT_LINE('División entre cero PROCEDURE');
end;


--------------gana el procedure porque es el más cercano a la excepción, puedes tener una vivisión, des

begin 
    sp_dividir_numeros (12,0);
EXCEPTION
    when ZERO_DIVIDE then   
     DBMS_OUTPUT.PUT_LINE('División entre cero PLSQL outer');
end;