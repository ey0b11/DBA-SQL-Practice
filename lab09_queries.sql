-- Set environment for SQLPlus
SET LINESIZE 200;
SET PAGESIZE 100;

-- 1. Display the name, department number, and department name for all employees.
SELECT e.ename, e.deptno, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno;

-- 2. Create a unique listing of all jobs in department 30, including the location of department 30.
SELECT DISTINCT e.job, d.loc
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.deptno = 30;

-- 3. Display the employee name, department name, and location of all employees who earn a commission.
SELECT e.ename, d.dname, d.loc
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.comm IS NOT NULL;

-- 4. Display the employee name and department name for all employees who have an 'A' in their name.
SELECT e.ename, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.ename LIKE '%A%';

-- 5. Display the name, job, department number, and department name for all employees who work in DALLAS.
SELECT e.ename, e.job, e.deptno, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE d.loc = 'DALLAS';

-- 6. Display the employee name, employee number, manager’s name, and manager number.
SELECT e1.ename AS "Employee", e1.empno AS "Emp#", e2.ename AS "Manager", e2.empno AS "Mgr#"
FROM emp e1
JOIN emp e2
ON e1.mgr = e2.empno;

-- 7. Modify the answer of question 6 to include KING (who has no manager).
-- Corrected the NVL to ensure data type consistency
SELECT e1.ename AS "Employee", e1.empno AS "Emp#", NVL(e2.ename, 'No Manager') AS "Manager", NVL(TO_CHAR(e2.empno), 'No Mgr#') AS "Mgr#"
FROM emp e1
LEFT JOIN emp e2
ON e1.mgr = e2.empno;

-- 8. Display the employee name, department number, and all employees that work in the same department as a given employee.
SELECT e1.deptno, e1.ename AS "Employee", e2.ename AS "Colleague"
FROM emp e1
JOIN emp e2
ON e1.deptno = e2.deptno
AND e1.ename != e2.ename
ORDER BY e1.deptno, e1.ename;

-- 9. Show the structure of the SALGRADE table, then display name, job, department name, salary, and grade for all employees.
-- First, use this to display the structure of the table (manually run if needed):
DESC salgrade;

-- Then, execute this query:
SELECT e.ename, e.job, d.dname, e.sal, s.grade
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal;

-- 10. Display the name and hire date of any employee hired after employee BLAKE.
SELECT e.ename, e.hiredate
FROM emp e
WHERE e.hiredate > (SELECT hiredate FROM emp WHERE ename = 'BLAKE');

-- 11. Display employee names, hire dates, along with their manager's name and hire date for employees hired before their managers.
SELECT e1.ename AS "Employee", e1.hiredate AS "Emp Hiredate", e2.ename AS "Manager", e2.hiredate AS "Mgr Hiredate"
FROM emp e1
JOIN emp e2
ON e1.mgr = e2.empno
WHERE e1.hiredate < e2.hiredate;