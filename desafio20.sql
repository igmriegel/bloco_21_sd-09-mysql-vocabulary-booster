USE hr;
DELIMITER $$

CREATE PROCEDURE exibir_historico_completo_por_funcionario(IN email VARCHAR(60))
BEGIN
    SELECT 
        CONCAT(e.FIRST_NAME,' ',e.LAST_NAME) AS 'Nome completo',
        d.DEPARTMENT_NAME AS 'Departamento',
        j.JOB_TITLE AS 'Cargo'
    FROM
        hr.job_history AS h
            LEFT JOIN
        hr.employees AS e ON h.EMPLOYEE_ID = e.EMPLOYEE_ID
            LEFT JOIN
        hr.jobs AS j ON h.JOB_ID = j.JOB_ID
            LEFT JOIN
        hr.departments AS d ON h.DEPARTMENT_ID = d.DEPARTMENT_ID
    WHERE e.EMAIL LIKE CONCAT('%', email, '%')
    ORDER BY `Departamento`, `Cargo`;
END $$

DELIMITER ;
