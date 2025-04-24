DECLARE 
    cursor cursor_emp is
    select apellido, salario, oficio
    from EMP;
BEGIN 
    for v_registro in cursor_emp /*inventamos una variable*/
    LOOP
        DBMS_OUTPUT.PUT_LINE('Apellido ' || v_registro.apellido);
        DBMS_OUTPUT.PUT_LINE('Ofici ' || v_registro.oficio);
        

      
    END LOOP;
END;