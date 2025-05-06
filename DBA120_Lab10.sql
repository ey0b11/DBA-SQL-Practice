-- 1. Display the current date
SELECT SYSDATE AS "Date" FROM dual;
/* 
Output:
Date
---------
12-AUG-21
*/

-- 2. Display employee number, name, salary, and a 15% salary increase
SELECT empno, ename, sal, 
       ROUND(sal * 1.15) AS "New Salary"
FROM emp;
/* 
Output:
EMPNO  ENAME   SAL  New Salary
-----  ------  ----  ----------
7839   KING    5000  5750
7698   BLAKE   2850  3278
7782   CLARK   2450  2818
...
*/

-- 3. Add an additional column showing the increase amount
SELECT empno, ename, sal, 
       ROUND(sal * 1.15) AS "New Salary", 
       ROUND((sal * 1.15) - sal) AS "Increase"
FROM emp;
/* 
Output:
EMPNO  ENAME   SAL  New Salary  Increase
-----  ------  ----  ----------  --------
7839   KING    5000  5750         750
7698   BLAKE   2850  3278         428
7782   CLARK   2450  2818         368
...
*/

-- 4. Display name, hire date, and salary review date, which is 6 months later on the first Monday
SELECT ename, hiredate, 
       TO_CHAR(NEXT_DAY(ADD_MONTHS(hiredate, 6) - 1, 'MONDAY'), 
       'Day, "the" DDth "of" Month, YYYY') AS "Review"
FROM emp;
/* 
Output:
ENAME    HIREDATE    REVIEW
-------- ----------- --------------------------------------------
KING     17-NOV-81   Monday, the Twenty-Fourth of May, 1982
BLAKE    01-MAY-81   Monday, the Second of November, 1981
CLARK    09-JUN-81   Monday, the Fourteenth of December, 1981
...
*/

-- 5. Display name and months worked, ordered by months worked
SELECT ename, 
       CEIL(MONTHS_BETWEEN(SYSDATE, hiredate)) AS "Months_Worked"
FROM emp
ORDER BY "Months_Worked";
/* 
Output:
ENAME     Months_Worked
--------- --------------
ADAMS     463
SCOTT     464
MILLER    475
FORD      476
...
*/

-- 6. Display a message with current and desired (3x) salary
SELECT ename || ' earns $' || sal || '.00 monthly but wants $' || (sal * 3) || '.00' AS "Dream Salaries"
FROM emp;
/* 
Output:
Dream Salaries
---------------------------------------------
KING earns $5000.00 monthly but wants $15000.00
BLAKE earns $2850.00 monthly but wants $8550.00
...
*/

-- 7. Display name and formatted salary padded with $
SELECT ename, 
       LPAD(sal, 15, '$') AS "Salary"
FROM emp;
/* 
Output:
ENAME      SALARY
---------- ---------------
KING       $$$$$$$$$$$5000
BLAKE      $$$$$$$$$$$2850
CLARK      $$$$$$$$$$$2450
...
*/

-- 8. Display name with the first letter capitalized and the length of the name for names starting with J, A, or M
SELECT INITCAP(ename) AS "Name", 
       LENGTH(ename) AS "Length"
FROM emp
WHERE SUBSTR(ename, 1, 1) IN ('J', 'A', 'M');
/* 
Output:
Name       Length
---------- ------
Jones      5
Martin     6
Allen      5
...
*/

-- 9. Display name, hire date, and the day of the week they were hired, ordered by day
SELECT ename, hiredate, 
       TO_CHAR(hiredate, 'Day') AS "Day"
FROM emp
ORDER BY TO_CHAR(hiredate, 'D');
/* 
Output:
ENAME      HIREDATE     DAY
---------- -----------  ------
MARTIN     28-SEP-81    MONDAY
CLARK      09-JUN-81    TUESDAY
...
*/

-- 10. Display employee name and commission amount or "No Commission" if none
SELECT ename, 
       NVL(TO_CHAR(comm), 'No Commission') AS "Comm"
FROM emp;
/* 
Output:
ENAME      COMM
---------- -------------------
KING       No Commission
BLAKE      No Commission
MARTIN     1400
...
*/

-- 11. Display name and salary as asterisks (1 asterisk per $100), ordered by salary
SELECT ename, 
       RPAD('*', sal / 100, '*') AS "Employee_and_Their_Salaries"
FROM emp
ORDER BY sal DESC;
/* 
Output:
ENAME      Employee_and_Their_Salaries
---------- ----------------------------
KING       **************************************************
SCOTT      ******************************
FORD       ******************************
...
*/

-- 12. Display job grades for each job type
SELECT job, 
       CASE job
           WHEN 'PRESIDENT' THEN 'A'
           WHEN 'MANAGER' THEN 'B'
           WHEN 'ANALYST' THEN 'C'
           WHEN 'SALESMAN' THEN 'D'
           WHEN 'CLERK' THEN 'E'
           ELSE 'O' 
       END AS "Grade"
FROM emp
ORDER BY "Grade";
/* 
Output:
JOB        GRADE
---------- -----
PRESIDENT  A
MANAGER    B
ANALYST    C
SALESMAN   D
CLERK      E
...
*/