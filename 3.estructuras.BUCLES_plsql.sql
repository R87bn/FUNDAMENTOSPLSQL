----------------BUCLES--------------

--MUESTRA LA SUMA DE LOS PRIMEROS 100 NÚMEROS


            --1: LOOP: 

DECLARE
    --VARIABLES CONTADOR SUELEN DENOMINARSE CON LAS LETRAS i, z, k
    i int; --podemos poner el valor al inicio  i int: 1= ;
    suma int;
BEGIN
    --debemos iniciar i, de lo contrario será null
    i:= 1;
    --iniciamos suma
    suma := 0;
    LOOP    
        --INSTRUCCIONES
        suma:= suma + i;
        --incrementamos i
        i := i + 1;
        --INDICAMOS CUANDO SALIR DEL BUCLE
        exit when i > 100;
    END LOOP;    
    DBMS_OUTPUT.PUT_LINE ('La suma de los 100 primeros números es :' || suma);
END;

            --2: WHILE: LA CONDICIÓN SE EVALUA ANTES DE ENTRAR

DECLARE
    i int;
    suma int;
BEGIN
    --iniciamos las variables
    i :=1;
    suma := 0;
    WHILE i <= 100 LOOP -- i < 101
        --instrucciones
        suma := suma + i;
        i := i + 1;
    END LOOP;
     DBMS_OUTPUT.PUT_LINE ('La suma de los 100 primeros números es :' || suma);
END;

            --3: FOR..LOOP (CONTADOR): 
--SABEMOS CUANDO EMPIEZA Y ACABA

DECLARE
    suma int;
BEGIN
    suma := 0;
    FOR i in 1..100 LOOP
        suma := suma + i;
    END LOOP;
     DBMS_OUTPUT.PUT_LINE ('La suma de los 100 primeros números es :' || suma);
END;

DECLARE
    suma int;
BEGIN
    suma := 0;
    FOR CONTADOR in 1..100 LOOP
        suma := suma + CONTADOR;
    END LOOP;
     DBMS_OUTPUT.PUT_LINE ('La suma de los 100 primeros números es :' || suma);
END;

            --4: GOTO
DECLARE
    suma int;
BEGIN
    suma := 0;
    DBMS_OUTPUT.PUT_LINE('INICIO');
    --GOTO CODIGO; ANULARÍA LA ENTRADA AL BUCLE, SE VA A LA ETIQUETA DIRFECTAMENTE SALTANDO EL BLOQUE DE CÓDIGO INTERMEDIO
    DBMS_OUTPUT.PUT_LINE('ANTES DEL BUCLE');
    FOR CONTADOR in 1..100 LOOP
        suma := suma + CONTADOR;
    END LOOP;

    <<CODIGO>>
      DBMS_OUTPUT.PUT_LINE('DESPUÉS DEL BUCLE');
     DBMS_OUTPUT.PUT_LINE ('La suma de los 100 primeros números es :' || suma);
END;

            --5: NULL: PERMITE FINALIZAR LA INSTRUCCIÓN

declare
    i int;
begin
    --debemos iniciar las variables
    i := 1;
    if (i >= 1) then
        dbms_output.put_line('i es mayor a 1');
    else
        null;
    end if;
end;


----------PRÁCTICA--------------
--BUCLE PARA MOSTRAR LOS NUM DEL 1-10 CON 
    --WHILE

DECLARE
    i int;
    suma int;
BEGIN
    i := 1;
    suma := 0;
    while i <= 10 LOOP
        suma := suma + i;
        i := i + 1;
    end loop;
    dbms_output.put_line('La suma de los 10 primeros números es '
    || suma);
end;

    --FOR 

DECLARE
    suma int;
BEGIN
    suma := 0;
    FOR CONTADOR in 1..10 LOOP
        suma := suma + CONTADOR;
    END LOOP;
     DBMS_OUTPUT.PUT_LINE ('La suma de los 10 primeros números es :' || suma);
END;

--PEDIR AL USUARIO UN $inicio y un $final
--MOSTRAR LOS NUM COMPRENDIDOS EN ESE RANGO

DECLARE
    inicio int;
    fin int;
BEGIN
    inicio := &inicial;
    fin := &final;
    for i in inicio..fin loop
        dbms_output.put_line(i);
    end loop;
    dbms_output.put_line('fin del programa');
END;
undefine inicial;
undefine final;

--si el num inicial es mayor lo indicamos no hacemos el bucle

DECLARE
    inicio int;
    fin int;
BEGIN
    inicio := &inicial;
    fin := &final;
    --preguntamos por los valores
    if (inicio >= fin) then 
           dbms_output.put_line('El num de inicio (' || inicio ||') debe ser menor al num de fin (' || fin ||')');
    else 
        for i in inicio..fin loop
        dbms_output.put_line(i);
        end loop;
    end if;
    dbms_output.put_line('fin del programa');
END;
undefine inicial;
undefine final;

--QUEREMOS UN BUCLE PIDIENDO UN INICIO Y UN FIN
--MOSTRAMOS SÓLO LOS NÚMEROS PARES

DECLARE
    inicio int;
    fin int;
BEGIN
    inicio := &inicial;
    fin := &final;
    if (inicio >= fin) then 
           dbms_output.put_line('El num de inicio (' || inicio ||') debe ser menor al num de fin (' || fin ||')');
    else 
        for i in inicio..fin loop
            --AÑADIMOS EL RESTO
            IF MOD(i, 2) = 0 THEN      --IMPARES!!      IF MOD(i, 2) <> 0 THEN
            dbms_output.put_line(i);
            END IF;
        end loop;
    end if;
    dbms_output.put_line('fin del programa');
END;
undefine inicial;
undefine final;