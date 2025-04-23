--------------------------CURSORES-----------------
--Bloque para consultas de acción,insertar un DEPT en un bloque PL-SQL




DECLARE
    v_nombre dept.dnombre%type;
    v_loc dept.loc%TYPE;
BEGIN
    --realizamos un bucle para insertar 5 dept
    for i in 1..5 loop
    v_nombre := 'Departamento ' || i;
    v_loc := 'Localidad ' || i;
    insert into DEPT values (i, v_nombre, v_loc);
    end loop;
    DBMS_OUTPUT.PUT_LINE('Fin del programa');
END;

select * from dept;

---------------PONEMOS UN SELECT PARA SELECCIONAR EL MAAXIMO CON UNA SUBCONSULTA-----------

DECLARE
    v_nombre dept.dnombre%type;
    v_loc dept.loc%TYPE;
BEGIN
    --realizamos un bucle para insertar 5 dept
    for i in 1..5 loop
    v_nombre := 'Departamento ' || i;
    v_loc := 'Localidad ' || i;
    insert into DEPT values 
    ((SELECT max(DEPT_NO) +1 from DEPT),
    v_nombre, v_loc);
    end loop;
    DBMS_OUTPUT.PUT_LINE('Fin del programa');
END;

select * from dept;
rollback;

--REALIZAR UN BLOQUE PL/SQL QUE PEDIRÁ UN Nº AL USuARIO PARA MOSTRAR EL DEPT CON DICHO Nº


DECLARE
    v_id int;
begin
    v_id := &numero;
    SELECT * from DEPT where DEPT_NO = v_id;
end;

undefine numero;
------------------------
--FETCH SE MUEVE DE FILA A FILA PARA RECUPERAR LOS DATOS
--CURSORES IMPLICITOS SOLO PUEDEN DEVOLVER UNA FILA
    --RECUPERAR  EL OFICIO DEL APELLIDO REY


--CURSOR IMPLÍCITO
DECLARE
    v_oficio EMP.OFICIO%TYPE;
BEGIN
    select OFICIO into v_oficio from EMP where upper(APELLIDO) = 'REY';
        DBMS_OUTPUT.PUT_LINE('El oficio de REY es...' || v_oficio);
END;

--CURSOR EXPLÍCITO
--Pueden devolver más de una fila, es necesario declararlos
--Mostrar apellido y salario de todos los EMP

DECLARE
v_sal EMP.SALARIO%TYPE;
v_ape EMP.APELLIDO%TYPE;
--declaramos el cursor con una consulta
--que debe tener los mismos datos para hacer el FETCH
cursor CURSOREMP is
select APELLIDO, SALARIO from EMP;
BEGIN
--abrimos el cursor
    open CURSOREMP;
    --bucle infinito
    LOOP
        --extraemos los datos del cursor en e mismo orden del select
        fetch CURSOREMP into v_ape, v_sal;
        --dibujamos las variables
        DBMS_OUTPUT.PUT_LINE('APELLIDO ' || v_ape || ', SALARIO: ' ||v_sal);
        EXIT when CURSOREMP%notfound;
    END LOOP;
END;
--se repite GUTIERREZ porque llega a gutierrez, pasa a not fund,sigue leyendo, vuekve a pintar el último registro y ya sale
--pasamos exit a después del fetch
select * from emp where apellido = 'gutierrez';

DECLARE
v_sal EMP.SALARIO%TYPE;
v_ape EMP.APELLIDO%TYPE;
--declaramos el cursor con una consulta
--que debe tener los mismos datos para hacer el FETCH
cursor CURSOREMP is
select APELLIDO, SALARIO from EMP;
BEGIN
--abrimos el cursor
    open CURSOREMP;
    --bucle infinito
    LOOP
        --extraemos los datos del cursor en e mismo orden del select
        fetch CURSOREMP into v_ape, v_sal;
        EXIT when CURSOREMP%notfound;
        --dibujamos las variables
        DBMS_OUTPUT.PUT_LINE('APELLIDO ' || v_ape || ', SALARIO: ' ||v_sal);
        EXIT when CURSOREMP%notfound;
    END LOOP;
END;

-------------------ARTRIBUTOS--------------
--SQL% hace referencia a la última consulta de acción

--ATRIBUTO ROWCOUNT PARA LAS CONSULTAS DE ACCION
--INCREMENTAR EN 1 EL SALARIO PARA EMP=10
--MOSTRAR EL Nº DE EMP MODIFICADOS

BEGIN
    update EMP set SALARIO = SALARIO + 1
    where DEPT_NO=10;
    dbms_output.put_line('Empleados modificados: '
    || SQL%ROWCOUNT);
END;

--INCREMENTAR EN 10.000 AL EMPLEADO QUE MENOS COBRE EN LA EMPRESA
    --QUÉ NECESITO?
        --min SALARIO IMPLICITO (1 FILA)
        --UPDATE al SALARIO

DECLARE
V_minimo_salario EMP.SALARIO%TYPE;

BEGIN
    SELECT min(SALARIO) into v_minimo_salario from EMP;
    update EMP set SALARIO = SALARIO + 10003
    where salario = v_minimo_salario;
      dbms_output.put_line('Salario incrementado a ' ||SQL%ROWCOUNT || ' empleados');
end;

--------------------------si tenemos codigo plsql evitar subconsultas y usar variables, el primer código es  más lento

BEGIN
    UPDATE EMP
    SET SALARIO = SALARIO + 10003
    WHERE SALARIO = (SELECT MIN(SALARIO) FROM EMP);

    DBMS_OUTPUT.PUT_LINE('Salario actualizado para el empleado con el salario más bajo');
END;

select * from emp;

--apuntamos al empleado
DECLARE
v_minimo_salario EMP.SALARIO%TYPE;
v_apellido EMP.APELLIDO%TYPE;
BEGIN
    SELECT min(SALARIO) into v_minimo_salario from EMP;
    --almacenamos a la persona
    select APELLIDO into v_apellido from EMP
    where SALARIO = V_minimo_salario;
    update EMP set SALARIO = SALARIO + 10003
    where salario = v_minimo_salario;
      dbms_output.put_line('Salario incrementado a ' ||SQL%ROWCOUNT || ' empleados , ' || v_apellido);
end;

--REALIZAR UN CÓDIGO PL-SQL DONDE PEDIMOS Nº, NOMBRE Y LOC DE UN DEPT (VARIABLES DE SUSTITUCIÓN)
--SI EL DEPT EXISTE MODIFICAMOS NOMBRE Y LOCALIDAZ
--SI NO EXISTE LO insertamos

select * from DEPT;
 
DECLARE
v_id DEPT.DEPT_NO%TYPE;
v_nombre DEPT.DNOMBRE%TYPE;
v_localidad DEPT.LOC%TYPE;
v_existe DEPT.DEPT_NO%TYPE;--variable para ver si existe el dept
cursor CURSORDEPT is 
    select DEPT_NO from dept
    where DEPT_NO=v_id;

BEGIN
    v_id := &id; /*v_id := 10///50 PROBAMOS CON UN DEPT Q EXISTE, 10, OTRO Q NO, 50*/
    v_nombre := '&nombre';
    v_localidad := '&localidad';
    open CURSORDEPT;
        FETCH CURSORDEPT INTO v_existe;
        --preguntamos por v_existe
        if (CURSORDEPT%FOUND) then 
            dbms_output.put_line('UPDATE');
            update DEPT set DNOMBRE= v_nombre, LOC= v_localidad
            where DEPT_NO=v_id;
        else
            dbms_output.put_line('INSERT');
            insert into DEPT values (v_id, v_nombre, v_localidad);
        end if;
        close CURSORDEPT;

END;

select * from emp;

undefine id;
undefine nombre;
undefine loc;
---------------




-------REALIZAR UN CÓDIGO PL-SQL PARA MODIFICAR EL SALARIO DE EMP=ARROYO
--SI COBRA ++250.000 LE BAJAMOS 10.000, SI COBRA -, LE BAJAMOS 10.000

DECLARE
v_salario EMP.SALARIO%TYPE;
v_apellido EMP.APELLIDO%TYPE;
v_consulta EMP.SALARIO%TYPE;
BEGIN
v_salario := &salario;
v_apellido := '&apellido';

    select COUNT(EMP.SALARIO) into v_consulta from EMP
    where SALARIO=v_salario;
        if (v_consulta>250000) THEN
            dbms_output.put_line('UPDATE');
            update EMP set SALARIO =(SALARIO + 10000);
        else 
               dbms_output.put_line('UPDATE');
            update EMP set SALARIO =(SALARIO - 10000);
        end if;
END;