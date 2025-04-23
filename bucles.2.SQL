--Necesito mostrar la suma salarial de los doctores de la paz.
--Realizar el siguiente código pl/sql.
--Necesitamos modificar el salario de los doctores de LA PAZ.
--Si la suma salarial supera 1.000.000 bajamos salarios en 10.000 a todos
--Si la suma salarial no supera el millón, subimos salarios en 10.000
--Mostrar el número de filas que hemos modificado (subir o bajar)
--Doctores con suerte: 6, Doctores más pobres: 6
describe doctor;
declare
   v_suma_salarial NUMBER; 
begin
    select sum(DOCTOR.SALARIO) into v_suma_salarial
    from DOCTOR
    inner join HOSPITAL
    on DOCTOR.HOSPITAL_COD = HOSPITAL.HOSPITAL_COD
    where lower(HOSPITAL.NOMBRE)='la paz';
    dbms_output.put_line('Suma salarial La paz: ' || v_suma_salarial);    
    if v_suma_salarial > 1000000 then
        update DOCTOR set SALARIO = SALARIO - 10000
        where hospital_cod=
        (select HOSPITAL_COD from HOSPITAL where UPPER(NOMBRE)='LA PAZ');
        dbms_output.put_line('Bajando salarios: ' || SQL%ROWCOUNT);
    else 
        update DOCTOR set SALARIO = SALARIO + 10000
        where hospital_cod=
        (select HOSPITAL_COD from HOSPITAL where UPPER(NOMBRE)='LA PAZ');
        dbms_output.put_line('Doctores ricos ' || SQL%ROWCOUNT);
    end if;
end;
--SOLUCION 2
declare
   v_suma_salarial NUMBER; 
   v_codigo HOSPITAL.HOSPITAL_COD%TYPE;
begin
    select HOSPITAL_COD into v_codigo from HOSPITAL
    where lower(NOMBRE)='la paz';
    select sum(SALARIO) into v_suma_salarial
    from DOCTOR 
    where HOSPITAL_COD=v_codigo;
    dbms_output.put_line('Suma salarial La paz: ' || v_suma_salarial);    
    if v_suma_salarial > 1000000 then
        update DOCTOR set SALARIO = SALARIO - 10000
        where hospital_cod=v_codigo;
        dbms_output.put_line('Bajando salarios: ' || SQL%ROWCOUNT);
    else 
        update DOCTOR set SALARIO = SALARIO + 10000
        where hospital_cod=v_codigo;
        dbms_output.put_line('Doctores ricos ' || SQL%ROWCOUNT);--CALCULA LAS FILAS MOD DE LA ULTIMA CONSULTA
    end if;
end;

--QUIERO UN BLOQUE PL-SQL QUE MUESTRE LOS DATOS DEL DC CAJAL
--HABRRIA QUE HACER UNA VARIABLE PARA CADA CAMPO
--ROWTYPE TE INDICA EL DESCRIBE DE LA TABLA
--REALIZAMOS LA DECLARACION CON DEPT
DESCRIBE DEPT;

DECLARE
    v_id number;
BEGIN
DBMS_OUTPUT.PUT_LINE('El valor de v_id es ' || v_id );
END;

--al ser un "describe", da null

DECLARE
    v_id DEPT.DEPT_NO%TYPE;
BEGIN
DBMS_OUTPUT.PUT_LINE('El valor de v_id es ' || v_id );
END;
-------
DECLARE
    v_id DEPT.DEPT_NO%TYPE;--co null funcionaria al ser palabra reservada, otro string no
BEGIN
DBMS_OUTPUT.PUT_LINE('El valor de v_id es ' || v_id );
END;
----
DECLARE
    v_fila DEPT%ROWTYPE;
BEGIN
    V_fila.DEPT_NO := null;
DBMS_OUTPUT.PUT_LINE('El valor de v_id es ' || v_fila.DEPT_NO );
END;
--------
describe dept;
DECLARE
    v_fila DEPT%ROWTYPE;
    cursor cursor_dept is
    select * from DEPT;
BEGIN
    open cursor_dept;
    loop 
        fetch cursor_dept into v_fila;
        exit  when cursor_dept%notfound;
        DBMS_OUTPUT.PUT_LINE('ID ' || v_fila.DEPT_NO );
        DBMS_OUTPUT.PUT_LINE('Nombre ' || v_fila.DNOMBRE );
        DBMS_OUTPUT.PUT_LINE('Localidad ' || v_fila.LOC );
    end loop;
    close cursor_dept;
END;