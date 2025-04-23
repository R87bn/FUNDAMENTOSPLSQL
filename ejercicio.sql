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
        DBMS_OUTPUT.PUT_LINE('La suma de ' ||v_texto_numero || 'es ' || v_suma);
         DBMS_OUTPUT.PUT_LINE('Fin del programa');
end;
undefine texto;