-- Create Tables
CREATE TABLE DEPARTMENT6 AS
SELECT deptno AS ID, dname, loc AS location FROM dept WHERE deptno BETWEEN 10 AND 40;

ALTER TABLE DEPARTMENT6 ADD CONSTRAINT dept6_pk PRIMARY KEY (ID);

CREATE TABLE EMPLOYEE6 AS
SELECT empno AS empID, ename AS name, sal AS salary, deptno AS deptID FROM emp WHERE deptno < 40;

ALTER TABLE EMPLOYEE6 ADD CONSTRAINT employee_id_pk PRIMARY KEY (empID);

ALTER TABLE EMPLOYEE6 ADD CONSTRAINT emp6_fk FOREIGN KEY (deptID) REFERENCES DEPARTMENT6(ID);

-- Create Sequence
CREATE SEQUENCE DEPT_ID_SEQ START WITH 60 INCREMENT BY 10 MAXVALUE 200;

-- Display Sequence Information
SELECT sequence_name, max_value, increment_by, last_number FROM user_sequences WHERE sequence_name = 'DEPT_ID_SEQ';

-- Insert New Departments
INSERT INTO DEPARTMENT6 (ID, Dname) VALUES (DEPT_ID_SEQ.NEXTVAL, 'Education');
INSERT INTO DEPARTMENT6 (ID, Dname) VALUES (DEPT_ID_SEQ.NEXTVAL, 'Administration');

-- Create Index
CREATE INDEX emp_dept_id_idx ON EMPLOYEE6(deptID);

-- Display Index Information
SELECT index_name, table_name, uniqueness FROM user_indexes WHERE table_name = 'EMPLOYEE6';
