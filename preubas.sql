DECLARE

    v_salario  EMP.SALARIO%TYPE;
    v_apellido EMP.APELLIDO%TYPE := '&apellido';      -- 'ARROYO'
BEGIN
    -- 1) Obtener el salario actual de ARROYO
    SELECT SALARIO INTO v_salario
      FROM EMP
     WHERE APELLIDO = v_apellido;

    -- 2) Modificar según la condición
    IF v_salario > 250000 THEN
        v_salario := v_salario - 10000;
    ELSE
        v_salario := v_salario + 10000;
    END IF;

    -- 3) Aplicar el cambio solo a ARROYO
    UPDATE EMP
       SET SALARIO = v_salario
     WHERE APELLIDO = v_apellido;

    DBMS_OUTPUT.PUT_LINE(
      'Salario de ' || v_apellido || ' actualizado a ' || v_salario
    );
END;
/
