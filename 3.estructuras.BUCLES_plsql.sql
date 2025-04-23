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

--CONJETURA DE COLLATZ:
--TEORÍA: CUALQUIER NUM SIEMPRE LLEGARÁ A SER 1 SIGUIENDO UNA SERIE DE INSTRUCCIONES
--SI EL NUM ES PAR, SE DIVIDE ENTRE 2
--SI ES IMPAR, SE MÚLTIPLICA * 3 Y SUMANOS 1 ( N * 3 + 1)
--6--> 6/2=3 3*3+1= 10, 10/2 = 5...16, 8, 4, 2, 1

DECLARE
    num INT;
BEGIN
    num := &numero;
    DBMS_OUTPUT.PUT_LINE(num); -- Imprime el número inicial

    LOOP
        EXIT WHEN num = 1; -- Condición de salida

        IF MOD(num, 2) = 0 THEN
            num := num / 2;
        ELSE
            num := num * 3 + 1;
        END IF;

        DBMS_OUTPUT.PUT_LINE(num); -- Imprime el número después de cada operación
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Fin del programa');
END;
/
undefine numero;
---------------------------------------------
DECLARE
    numero int;
BEGIN
    numero := &valor;
    while numero <> 1 LOOP
        IF MOD(numero, 2) = 0 THEN
          numero := numero / 2;
        ELSE
            numero := numero * 3 + 1;
        END IF;
    DBMS_OUTPUT.PUT_LINE(numero);
    end loop;
    DBMS_OUTPUT.PUT_LINE('Fin del programa');
END;

undefine valor;

DECLARE
num int;
BEGIN
    num := &numero;
    DBMS_OUTPUT.PUT_LINE(num); -- Imprime el número inicial

    LOOP


        IF MOD(num, 2) = 0 THEN
            num := num / 2;
        ELSE
            num := num * 3 + 1;
        END IF;

        DBMS_OUTPUT.PUT_LINE(num); -- Imprime el número después de cada operación
        EXIT WHEN num = 1; -- Condición de salida, siempre despuéd de imprimir los num
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Fin del programa');
END;

undefine numero;

-- MOSTRAR LA TABLA DE MULTIPLICAR (DEL 1 AL 10) DE UN NUM QUE PIDAMOS

-- DECLARE
--     num int;
-- BEGIN
--     num := &num;
--     DBMS_OUTPUT.PUT_LINE( num ); 
--     DBMS_OUTPUT.PUT_LINE(num * 2); 
--     DBMS_OUTPUT.PUT_LINE(num * 3); 
--     DBMS_OUTPUT.PUT_LINE(num * 4); 
--     DBMS_OUTPUT.PUT_LINE(num * 5); 
--     DBMS_OUTPUT.PUT_LINE(num * 6); 
--     DBMS_OUTPUT.PUT_LINE(num * 7); 
--     DBMS_OUTPUT.PUT_LINE(num * 8); 
--     DBMS_OUTPUT.PUT_LINE(num * 9); 
--     DBMS_OUTPUT.PUT_LINE(num * 10); 
-- DBMS_OUTPUT.PUT_LINE('Fin del programa');
-- END;

-- undefine num;

DECLARE
    numero int;
    operacion int;
BEGIN
    numero := &valor;
    for i in 1..10 loop 
    operacion := numero * i;
        DBMS_OUTPUT.PUT_LINE(numero || '*' || i || '=' || operacion); 
    end loop;
    DBMS_OUTPUT.PUT_LINE('Fin del programa');
end;
undefine valor;

--CREA UN PROGRAMA QUE NOS PIDA UN TEXTO, QUE LO RECORRA LETRA A LETRA 
--MOSTRANDO CADA UNA DE LAS LETRAS DE FORMA INDIVIDUAL

DECLARE
    v_texto varchar2(50);
    v_long int;
    v_letra varchar2(1);
BEGIN
    v_texto := '&texto';
    v_long := length(v_texto);
    --un elemento en oracle empieza en 1
    for i in 1..v_long loop
    --substring
    v_letra := substr(v_texto, i, 1);
    DBMS_OUTPUT.PUT_LINE(v_letra);
    end loop;
    DBMS_OUTPUT.PUT_LINE('Fin del programa');
END;

undefine texto;

--INTRODUCIR TEXTO NUMERICO, MOSTRAR LA SUMA DE DICHOS NUM EN UN MENSAJE

DECLARE
    v_texto VARCHAR2(50);
    v_digito CHAR(1);
    v_suma   NUMBER := 0;
BEGIN
    v_texto := '&texto'; -- Solicita al usuario que ingrese la cadena

    FOR i IN 1 .. LENGTH(v_texto) LOOP
        v_digito := SUBSTR(v_texto, i, 1);
        -- Verifica que el carácter sea un dígito
        IF v_digito BETWEEN '0' AND '9' THEN
            v_suma := v_suma + TO_NUMBER(v_digito);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Carácter no numérico encontrado: ' || v_digito);
            -- Opcional: puedes decidir cómo manejar caracteres no numéricos
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('La suma de los dígitos es: ' || v_suma);
END;
/
--------------ver en archivo "ejercicio"
DECLARE 
    v_texto_numero VARCHAR2(50);
    v_longitud int;
    v_letra char(1);
    v_suma int;
    v_numero int;
BEGIN
        v_suma := 0;
        v_texto_numero := '&texto';
        v_longitud := length(v_texto_numero);
        for i in 1..v_longitud loop
            v_letra := substr(v_texto_numero, i, 1);
            v_numero:= to_number(v_letra);
            DBMS_OUTPUT.PUT_LINE(v_letra);
            v_suma := v_suma + v_numero;
        end loop;
        DBMS_OUTPUT.PUT_LINE('La suma de ' ||v_texto_numero || ' es ' || v_suma);
         DBMS_OUTPUT.PUT_LINE('Fin del programa');
end;
undefine texto;