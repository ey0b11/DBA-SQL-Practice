-- Lab 12 SQL Script 


-- 1. Display the employee name and hire date for all employees in the same department as Blake (excluding Blake).
SELECT ENAME, HIREDATE 
FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE') 
  AND ENAME != 'BLAKE';
  
-- Expected Output:
-- ENAME       HIREDATE
-- ---------- ----------
-- ALLEN       20-FEB-81
-- WARD        22-FEB-81
-- MARTIN      28-SEP-81
-- TURNER      08-SEP-81
-- JAMES       03-DEC-81

-- 2. Display the employee number and name for all employees who earn more than the average salary, sorted by descending salary.
SELECT EMPNO, ENAME 
FROM EMP 
WHERE SAL > (SELECT AVG(SAL) FROM EMP) 
ORDER BY SAL DESC;

-- Expected Output:
-- EMPNO       ENAME
-- ----------  ----------
-- 7839        KING
-- 7902        FORD
-- 7788        SCOTT
-- 7566        JONES
-- 7698        BLAKE
-- 7782        CLARK

-- 3. Display the employee number and name for all employees who work in a department with any employee whose name contains a 'T'.
SELECT EMPNO, ENAME 
FROM EMP 
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%');

-- Expected Output:
-- EMPNO       ENAME
-- ----------  ----------
-- 7566        JONES
-- 7788        SCOTT
-- 7876        ADAMS
-- 7369        SMITH
-- 7902        FORD
-- 7698        BLAKE
-- 7654        MARTIN
-- 7499        ALLEN
-- 7844        TURNER
-- 7900        JAMES
-- 7521        WARD

-- 4. Display the employee name, department number, and job title for all employees whose department location is Dallas.
SELECT ENAME, DEPTNO, JOB 
FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS');

-- Expected Output:
-- ENAME       DEPTNO      JOB
-- ----------  ----------  ----------
-- JONES       20          MANAGER
-- FORD        20          ANALYST
-- SMITH       20          CLERK
-- SCOTT       20          ANALYST
-- ADAMS       20          CLERK

-- 5. Display the employee name and salary of all employees who report to King.
SELECT ENAME, SAL 
FROM EMP 
WHERE MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING');

-- Expected Output:
-- ENAME       SAL
-- ----------  ----------
-- BLAKE       2850
-- CLARK       2450
-- JONES       2975

-- 6. Display the department number, name, and job for all employees in the Sales department.
SELECT DEPTNO, ENAME, JOB 
FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'SALES');

-- Expected Output:
-- DEPTNO      ENAME       JOB
-- ----------  ----------  ----------
-- 30          BLAKE       MANAGER
-- 30          MARTIN      SALESMAN
-- 30          ALLEN       SALESMAN
-- 30          TURNER      SALESMAN
-- 30          JAMES       CLERK
-- 30          WARD        SALESMAN

-- 7. Modify query 3 to display the employee number, name, and salary for all employees who earn more than the average salary and work in a department with any employee with a 'T' in their name.
SELECT EMPNO, ENAME, SAL 
FROM EMP 
WHERE SAL > (SELECT AVG(SAL) FROM EMP) 
  AND DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%');

-- Expected Output:
-- EMPNO       ENAME       SAL
-- ----------  ----------  ----------
-- 7566        JONES       2975
-- 7788        SCOTT       3000
-- 7902        FORD        3000
-- 7698        BLAKE       2850