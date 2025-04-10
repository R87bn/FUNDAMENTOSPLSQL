DECLARE
    --mi comentario
    --declaramos la variable
    numero int;
BEGIN
    dbms_output.put_line('Mi primer bloque anónimo');
    numero:= 4;  ------ poner := junto
   dbms_output.put_line('valor número:' || numero);
    end;


    DECLARE
    texto varchar2(50);
    numero int;
BEGIN
    texto := 'mi primer SQL';
    dbms_output.put_line('Mensaje:' || texto);
    dbms_output.put_line('Mi primer bloque anónimo');
    numero:= 4; 
   dbms_output.put_line('valor número:' || numero);
      numero:= 45; 
   dbms_output.put_line('valor número nuevo:' || numero);
    end;

    --si quiero pedirle el nombre al usuario

    DECLARE
    nombre varchar2(20);
    BEGIN
        nombre := 'Alumno';
        dbms_output.put_line('Su nombre es ' || nombre);
        end;
--------------------------------------------------------
        DECLARE
    nombre varchar2(20);
    BEGIN
        nombre := '&dato';
        dbms_output.put_line('Su nombre es ' || nombre);
        end;

-----------guardar fecha actual---------

       DECLARE
    fecha date;
    texto varchar2(25);
    longitud int;
    BEGIN
       fecha := SYSDATE;
       texto := '&data1';
       --almacenar longitud del texto
       longitud := length(texto);
--longitud de texto
        dbms_output.put_line('La longitud de su texto es ' || longitud);
        --hoy es miercoles
         dbms_output.put_line('Hoy es ' || to_char(fecha, 'day'));
         --mostramos en consola la &data
          dbms_output.put_line(texto);
        end;

        -----realizar un ptograma donde pedimos dos numeros y sumarlo

             DECLARE
                    num1 int;
                    num2 int;
                    resultado int;
             BEGIN
            num1 := &2n;
            num2 := &1n;
            resultado := num1 + num2;

            dbms_output.put_line('La suma de ' || num1 || ' + ' || num2 || ' = ' || resultado);
        

            end;

---quitar def de variables, se ejecuta por separado al codigo, despues
-- undefine num1;
-- undefine num2;


----subimos el salario a los empleados del dept pedido mediante "&data"

DECLARE
    --declaramos una variable para almacenar el nº de dept
    v_dept int;
BEGIN
    --pedimos un numero de dept al usuario
    v_dept := &dept;
    update EMP set SALARIO = SALARIO + 1 where DEPT_NO = v_dept;
end;
        select * from emp;
        
UNDEFINE dept;

-------------------------DÍA 2 PL/SQL---------------
--DECLARAR VARIABLES COMO SU TIPO DE LA TABLA
--BLOQUE PARA INSERTAR UN DEPT

declare
    v_numero DEPT.DEPT_NO%TYPE;
    V_NOMBRE DEPT.DNOMBRE%TYPE;
    V_LOCALIDAD DEPT.LOC%TYPE;
BEGIN
    v_numero := &NUMERO;
    v_nombre := '&nombre';
    v_localidad := '&localidad';
    insert into DEPT values (v_numero, v_nombre, v_localidad);
end;

undefine numero;
undefine nombre;
undefine localidad;

SELECT * FROM DEPT;