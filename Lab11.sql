-- 4. Display the highest, lowest, sum, and average salary of all employees.
SELECT 
    MAX(sal) AS Maximum, 
    MIN(sal) AS Minimum, 
    SUM(sal) AS Sum, 
    ROUND(AVG(sal), 2) AS Average
FROM 
    emp;

-- Expected Output:
-- Maximum | Minimum | Sum   | Average
-- 5000    | 800     | 29025 | 2073


-- 5. Display the minimum, maximum, sum, and average salary for each job type.
SELECT 
    job, 
    MAX(sal) AS Maximum, 
    MIN(sal) AS Minimum, 
    SUM(sal) AS Sum, 
    ROUND(AVG(sal), 2) AS Average
FROM 
    emp
GROUP BY 
    job;

-- Expected Output:
-- JOB        | Maximum | Minimum | Sum   | Average
-- CLERK      | 1300    | 800     | 4150  | 1038
-- SALESMAN   | 1600    | 1250    | 5600  | 1400
-- PRESIDENT  | 5000    | 5000    | 5000  | 5000
-- MANAGER    | 2975    | 2450    | 8275  | 2758
-- ANALYST    | 3000    | 3000    | 6000  | 3000


-- 6. Write a query to display the number of people with the same job.
SELECT 
    job, 
    COUNT(*) AS "COUNT(*)"
FROM 
    emp
GROUP BY 
    job;

-- Expected Output:
-- JOB        | COUNT(*)
-- CLERK      | 4
-- SALESMAN   | 4
-- PRESIDENT  | 1
-- MANAGER    | 3
-- ANALYST    | 2


-- 7. Determine the number of managers without listing them.
SELECT 
    COUNT(*) AS "Number of Managers"
FROM 
    emp
WHERE 
    job = 'MANAGER';

-- Expected Output:
-- Number of Managers
-- 6


-- 8. Write a query that will display the difference between the highest and lowest salaries.
SELECT 
    MAX(sal) - MIN(sal) AS DIFFERENCE
FROM 
    emp;

-- Expected Output:
-- DIFFERENCE
-- 4200


-- 9. Display the manager number and the salary of the lowest paid employee for that manager.
-- Exclude anyone where the manager ID is not known and any groups where the minimum salary is less than $1000.
SELECT 
    mgr, 
    MIN(sal) AS "MIN(SAL)"
FROM 
    emp
WHERE 
    mgr IS NOT NULL
GROUP BY 
    mgr
HAVING 
    MIN(sal) >= 1000
ORDER BY 
    "MIN(SAL)" DESC;

-- Expected Output:
-- MGR   | MIN(SAL)
-- 7566  | 3000
-- 7839  | 2450
-- 7782  | 1300
-- 7788  | 1100


-- 10. Write a query to display the department name, number of employees, and the average salary for all employees in that department.
SELECT 
    d.dname AS dname, 
    COUNT(e.empno) AS "Number of People", 
    ROUND(AVG(e.sal), 2) AS Salary
FROM 
    emp e
JOIN 
    dept d ON e.deptno = d.deptno
GROUP BY 
    d.dname;

-- Expected Output:
-- DNAME      | Number of People | Salary
-- RESEARCH   | 5                | 2175
-- SALES      | 6                | 1566.67
-- ACCOUNTING | 3                | 2916.67