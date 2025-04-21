--DEBEMOS COMPROBAR SI UN NUMERO ES POSITIVO O NEGATIVO

declare 
    v_numeroO int;
BEGIN--pedimos el nº
    v_numeroO := &numeroo;
    --preguntamos si es positivo
if (v_numeroO >= 0) THEN
    dbms_output.put_line('POSITIVO: ' || v_numeroO);
ELSE 
    DBMS_OUTPUT.PUT_LINE('NEGATIVO: ' || V_NUMEROO);
end if;
    dbms_output.put_line('FIN DEL PROGRAMA');

end;

UNDEFINE NUMEROO;

-------------------------
DECLARE
    V_NUMERO INT;
BEGIN
    V_NUMERO := &NUMERO;
    IF (V_NUMERO > 0) THEN 
        dbms_output.put_line('POSITIVO: ' || V_NUMERO);
    ELSIF (V_NUMERO = 0) THEN 
        dbms_output.put_line('ES CERO: ' || V_NUMERO);
    ELSIF (V_NUMERO < 0) THEN 
        dbms_output.put_line('NEGATIVO: ' || V_NUMERO);
    end if;
    dbms_output.put_line('FIN DEL PROGRAMA');
    END;



UNDEFINE NUMERO;

------PIDE UN NUMERO AL USUARIO DEL 1 AL 4
-- 1-PRIMAVERA
-- 2-VERANO
-- 3-OTOÑO
-- 4-INVIERNO
-- -OTRO NUMERO, LE INDICAMOS QUE ESTÁ MAL

DECLARE
    v_estacion int;
BEGIN
    v_estacion := &estacion;
    if (v_estacion = 1) then
        dbms_output.put_line( v_estacion || ': CORRESPONDE A PRIMAVERA');
    ELSIF (v_estacion = 2) THEN
        dbms_output.put_line( v_estacion || ': CORRESPONDE A VERANO');
    ELSIF (v_estacion = 3) THEN
        dbms_output.put_line( v_estacion || ': CORRESPONDE A OTOÑO');
    ELSIF (v_estacion = 4) THEN
        dbms_output.put_line( v_estacion || ': CORRESPONDE A INVIERNO');
    ELSIF (v_estacion > 4) THEN
        dbms_output.put_line( v_estacion || ': VALOR INCORRECTO');
         end if;
    dbms_output.put_line('FIN DEL PROGRAMA');
    END;

    undefine estacion;

    ---------PEDIR DOS NUM Y DEVOLVER EL MAYOR
    DECLARE
        num1 int;
        num2 int;
    BEGIN
        num1 := &1num;
        num2 := &2num;
        if (num1 > num2) then
             dbms_output.put_line( num1 || ': es el número más alto ');
        elsif (num2 > num1) then
             dbms_output.put_line( num2 || ': es el número más alto ');
        elsif (num1 = num2) then 
            dbms_output.put_line( num2 || ': los números son iguales ');
        end if;
            dbms_output.put_line('FIN DEL PROGRAMA');
    END;

    undefine 1num
    undefine 2num

    --PEDIR NUM AL USUARIO Y PREGUNTAR SI ES PAR/IMPAR. HACEMOS LO QUE SABEMOS, PEDIMOS EL RESTO

    SELECT MOD (9,2) AS RESTO FROM DUAL; 

    DECLARE
        V_NUM INT;
    BEGIN
    V_NUM := &num;
        IF (MOD (V_NUM, 2) = 0) THEN
            dbms_output.put_line ('El número es par');
        else 
            dbms_output.put_line ('El número es impar');
        end if;
        dbms_output.put_line('FIN DEL PROGRAMA');
    end;

    undefine num

    --Podemos utilizar cualquier operador, tanto de comparación como relacional
    --Pedimos una letra al usuario, si es vocal pintamos vocal, si no, consonante
/
    declare
        v_letra varchar2(1);
    BEGIN
        v_letra := lower('&letra');
        if (v_letra = 'a' or v_letra = 'e' or v_letra = 'i' or v_letra = 'o' or v_letra ='u') then
            dbms_output.put_line ('vocal ' || v_letra);
        else 
            dbms_output.put_line ('consonante ' || v_letra);
             end if;
        dbms_output.put_line('FIN DEL PROGRAMA');
    end;
    /

    undefine letra

    --pedir tres numeros al usuario  y mostrar el mayor de ellos y el menor

    
/
DECLARE
    num1 INT;
    num2 INT;
    num3 INT;
    mayor INT;
    menor INT;
BEGIN
    num1 := &num1;  
    num2 := &num2;  
    num3 := &num3;  
    -- Usar GREATEST para obtener el valor máximo
    mayor := GREATEST(num1, num2, num3);
    
    -- Usar LEAST para obtener el valor mínimo
    menor := LEAST(num1, num2, num3);

    DBMS_OUTPUT.PUT_LINE('El número mayor es: ' || mayor);
    DBMS_OUTPUT.PUT_LINE('El número menor es: ' || menor);
END;
/
undefine num1
undefine num2
undefine num3
        

DECLARE
    num1 INT := &num1;  -- Asigna un valor aquí
    num2 INT := &num2;  -- Asigna un valor aquí
    num3 INT := &num3;  -- Asigna un valor aquí
    mayor INT;
    menor INT;
BEGIN
    -- Usar GREATEST para obtener el valor máximo
    mayor := GREATEST(num1, num2, num3);
    
    -- Usar LEAST para obtener el valor mínimo
    menor := LEAST(num1, num2, num3);

    DBMS_OUTPUT.PUT_LINE('El número mayor es: ' || mayor);
    DBMS_OUTPUT.PUT_LINE('El número menor es: ' || menor);
END;
/
undefine num1
undefine num2
undefine num3
        
--------------------MOSTRAR LOS TRES-----------
DECLARE
    num1 INT := &num1;  -- Asigna un valor aquí
    num2 INT := &num2;  -- Asigna un valor aquí
    num3 INT := &num3;  -- Asigna un valor aquí
    mayor INT;
    menor INT;
    medio INT;
BEGIN
    -- Determinar el mayor
    IF (num1 >= num2) AND (num1 >= num3) THEN
        mayor := num1;
        IF num2 >= num3 THEN
            medio := num2;
            menor := num3;
        ELSE
            medio := num3;
            menor := num2;
        END IF;
    ELSIF (num2 >= num1) AND (num2 >= num3) THEN
        mayor := num2;
        IF num1 >= num3 THEN
            medio := num1;
            menor := num3;
        ELSE
            medio := num3;
            menor := num1;
        END IF;
    ELSE
        mayor := num3;
        IF num1 >= num2 THEN
            medio := num1;
            menor := num2;
        ELSE
            medio := num2;
            menor := num1;
        END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE('El número mayor es: ' || mayor);
    DBMS_OUTPUT.PUT_LINE('El número medio es: ' || medio);
    DBMS_OUTPUT.PUT_LINE('El número menor es: ' || menor);
END;
/

undefine num1
undefine num2
undefine num3
/

