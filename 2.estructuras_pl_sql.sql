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

    --PEDIR NUM AL USUARIO Y PREGUNTAR SI ES PAR/IMPAR