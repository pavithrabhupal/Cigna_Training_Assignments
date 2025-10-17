--Assignment -1 Calculate Simple Interest 

DECLARE 
v_principal NUMBER;
v_time NUMBER;
v_interest FLOAT;
v_si FLOAT;

BEGIN
v_principal := 10000;
v_time := 4;
v_interest := 2.5;

v_si = (v_principal * v_time * v_interest)/100;

DBMS_OUTPUT.PUT_LINE('Simple Interest: ' || v_si);

END;


--Assignment 2 Employee Bonus Calculation

DECLARE
emp_name VARCHAR2(20);
salary FLOAT;
bonus FLOAT;

BEGIN
emp_name := 'Ana';
salary := 79000;

IF salary > 50000 THEN
   bonus := 0.10*salary;
   salary := bonus + salary;
ELSE
   bonus := 0.15*salary;
   salary := bonus + salary;
END IF;

DBMS_OUTPUT.PUT_LINE('Employee Name: ' || emp_name || ', salary is:' || salary);
END;


--Assignment 3 Retrive and display department details
DECLARE
    v_dept department %ROWTYPE;

BEGIN
    SELECT * FROM department WHERE dept_id = 10;
    DBMS_OUTPUT.PUT_LINE('Department _ID: ' || dept_id || 'Location: ' || loc);
END;

--Assignment 4 Student Marks Assignment
DECLARE
TYPE MARKS_TABLE IS TABLE OF NUMBER INDEX BY VARCHAR2(30);
STUDENT_MARKS MARKS_TABLE;

TOTAL_MARKS NUMBER:=0;
AVG_MARKS NUMBER :=0;
STUDENT_NAME VARCHAR(20);
COUNTER NUMBER:=0;
BEGIN
STUDENT_MARKS('Ana'):=95;
STUDENT_MARKS('Ken'):=85;
STUDENT_MARKS('Bob'):=75;
STUDENT_MARKS('Clarie'):=80;
STUDENT_MARKS('Alice'):=65;

DBMS_OUTPUT.PUT_LINE('STUDENT MARKS LIST:');
STUDENT_NAME :=STUDENT_MARKS.FIRST;
WHILE STUDENT_NAME IS NOT NULL LOOP
DBMS_OUTPUT.PUT_LINE(STUDENT_NAME||':'||STUDENT_MARKS(STUDENT_NAME));
TOTAL_MARKS:=TOTAL_MARKS+STUDENT_MARKS(STUDENT_NAME);
COUNTER:=COUNTER+1;
STUDENT_NAME:=STUDENT_MARKS.NEXT(STUDENT_NAME);
END LOOP;
AVG_MARKS:=TOTAL_MARKS/COUNTER;
DBMS_OUTPUT.PUT_LINE('TOTAL MARKS: '||TOTAL_MARKS);
DBMS_OUTPUT.PUT_LINE('AVG MARKS : '||ROUND(AVG_MARKS,2));
END;

--Assignment 5 Country Capital Lookup
DECLARE
TYPE country_capital_table IS TABLE OF VARCHAR2(50) INDEX BY VARCHAR2(50);
country_capital country_capital_table;
v_country VARCHAR2(50);
BEGIN
country_capital('INDIA'):='NEW DELHI';
country_capital('USA'):='WASHINGTON';
country_capital('FRANCE'):='PARIS';
country_capital('AUSTRALIA'):='CANBERRA';
country_capital('GERMANY'):='BERLIN';

v_country:='INDIA';
IF country_capital.EXISTS(v_country) THEN
DBMS_OUTPUT.PUT_LINE('The Capital Of'||v_country||' is '||country_capital(v_country));
ELSE
DBMS_OUTPUT.PUT_LINE('COUNTRY NOT IN LIST');
END IF;
END;
