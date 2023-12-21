USE HR;

SELECT * FROM COUNTRIES;
SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;
SELECT * FROM JOB_HISTORY;
SELECT * FROM JOBS;
SELECT * FROM LOCATIONS;
SELECT* FROM REGIONS;

                                   
                                   -- // ASSIGNMENT IN HR PAGE 29 // --  
                                   
-- Q1. Display all information in the tables EMP and DEPT. 
   
        SELECT * FROM EMPLOYEES;
        SELECT * FROM DEPARTMENTS;
            
-- Q2.Display only the hire date and employee name for each employee. 
  
          SELECT FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMPLOYEES ;
             
-- Q3.Display the ename concatenated with the job ID, separated by a comma and space, and name the column Employee and Title   
          
          SELECT CONCAT(FIRST_NAME,'  ', JOB_ID) AS 'EMPLOYEE AND TITLE' FROM EMPLOYEES;
          
-- Q4. Display the hire date, name and department number for all clerks.          
		
         SELECT HIRE_DATE, FIRST_NAME, DEPARTMENT_ID FROM EMPLOYEES;

-- Q5. Create a query to display all the data from the EMP table. Separate each column by a comma. Name the column THE OUTPUT           

     SELECT CONCAT(EMPLOYEE_ID, ', ', FIRST_NAME, ', ', LAST_NAME, ', ', EMAIL, ', ', PHONE_NUMBER, ', ', HIRE_DATE, ', ',
                     JOB_ID, ', ',COMMISSION_PCT, ',', MANAGER_ID, ',', DEPARTMENT_ID) AS 'THE OUTPUT' FROM EMPLOYEES;
		
-- Q6. Display the names and salaries of all employees with a salary greater than 2000.     
   
           SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY >2000;
           
-- Q7.Display the names and dates of employees with the column headers "Name" and "Start Date"            
   
          SELECT FIRST_NAME AS 'NAME', HIRE_DATE AS "START DATE" FROM EMPLOYEES ;

-- Q8. Display the names and hire dates of all employees in the order they were hired. 
      
         SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES ORDER BY HIRE_DATE;
         
-- Q9.Display the names and salaries of all employees in reverse salary order.

           SELECT FIRST_NAME ,SALARY  FROM EMPLOYEES ORDER BY SALARY DESC ;
           
-- Q10.Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.             

           SELECT FIRST_NAME, DEPARTMENT_ID, COMMISSION_PCT, SALARY FROM EMPLOYEES ORDER BY SALARY DESC;
           
-- Q11.Display the last name and job title of all employees who do not have a manager             

          SELECT LAST_NAME ,'JOB TITLE' FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
          
-- Q12.Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
            
            SELECT LAST_NAME,JOB_ID,SALARY FROM EMPLOYEES WHERE JOB_ID('SALES REPRESENTATIVE', ',' 'STOCK CLERK')
            AND SALARY NOT IN (2500, 3500, 5000);
            
            
                                        -- // ASSIGNMENT IN HR PAGE 30// --  
                                        
-- Q1.) Display the maximum, minimum and average salary and commission earned.                                          

		SELECT MAX(SALARY),MIN(SALARY),AVG(SALARY),
		MAX(COMMISSION_PCT),MIN(COMMISSION_PCT),AVG(COMMISSION_PCT) FROM EMPLOYEES;
        
-- Q2.) Display the department number, total salary payout and total commission payout for each department.  
         
	     SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY_PAYOUT,
         SUM(COMMISSION_PCT)AS TOTAL_COMMISSION_PAYOUT FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
         
-- Q3.) Display the department number and number of employees in each department.

               SELECT DEPARTMENT_ID, COUNT(*) AS NUMBER_OF_EMPLOYEES
               FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
               
-- Q4.) Display the department number and total salary of employees in each department. 

        SELECT DEPARTMENT_ID, SUM(SALARY) AS TOTAL_SALARY
        FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
        
-- Q5.) Display the employee's name who doesn't earn a commission. Order the result set without using the column name          
           
           SELECT FIRST_NAME FROM EMPLOYEES WHERE COMMISSION_PCT OR  COMMISSION_PCT =0 ORDER BY 1;
           
-- Q6.) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately            

		 SELECT FIRST_NAME AS EMPLOYEES_NAME, DEPARTMENT_ID AS DEPARTMENTID, COALESCE(COMMISSION_PCT,'NO COMMISSION') AS COMMISSION FROM EMPLOYEES;

-- Q7.) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately  

											SELECT 
											FIRST_NAME AS EMPLOYEESNAME,
											SALARY AS SALARY,
											CASE
											WHEN COMMISSION_PCT IS NOT NULL THEN COMMISSION_PCT * 2
											ELSE 'No commission'
											END AS COMMISSION
											FROM EMPLOYEES;
                                            
-- Q8.)  Display the employee's name, department id who have the first name same as another employee in the same department                                             

		                 SELECT FIRST_NAME , DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID 
                       IN (SELECT DEPARTMENT_ID FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING COUNT(*)>1);

-- Q9.)  Display the sum of salaries of the employees working under each Manager. 

           SELECT MANAGER_ID ,SUM(SALARY) FROM EMPLOYEES GROUP BY MANAGER_ID; 
           
-- Q10.)  Select the Managers name, the count of employees working under and the department ID of the manager            
           
           SELECT MANAGER_ID , COUNT(EMPLOYEE_ID) FROM EMPLOYEES GROUP BY MANAGER_ID;
           
-- Q11.) Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a! 

		       SELECT MANAGER_ID , DEPARTMENT_ID , SALARY, FIRST_NAME FROM EMPLOYEES
                       WHERE SUBSTRING(LAST_NAME, 2, 1)= 'A'
                    GROUP BY MANAGER_ID, DEPARTMENT_ID,SALARY , FIRST_NAME;
                    
-- Q12.)Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.                      

           		SELECT DEPARTMENT_ID,AVG(TOTAL_SALARY) AS TOTAL_SALARY FROM (SELECT DEPARTMENT_ID, SUM(SALARY) 
                AS TOTAL_SALARY FROM EMPLOYEES GROUP BY DEPARTMENT_ID) AS DEPARTMENT_SALARY
                       GROUP BY DEPARTMENT_ID ;            
                       
-- Q13). Select the maximum salary of each department along with the department id 

            SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT ;

-- Q14.) Display the commission, if not null display 10% of salary, if null display a default value 1.
              
              SELECT COALESCE(COMMISSION_PCT, SALARY * 0.10) AS 'COMMISSION' FROM EMPLOYEES ;

                              -- // ASSIGNMENT IN HR PAGE 31 // --
                              
-- Q1.) Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an 
                                                                  -- appropriate label.                                
                              
             SELECT SUBSTRING(LAST_NAME, 2,5),UCASE(LEFT(SUBSTRING(LAST_NAME, 2,5),1)) FROM EMPLOYEES;
             
-- Q2.) Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
                                                      -- month on which the employee has joined. 
             
                 SELECT CONCAT(FIRST_NAME , ',', LAST_NAME ),MONTH (HIRE_DATE) FROM EMPLOYEES
                   WHERE FIRST_NAME LIKE 'A%' OR LAST_NAME LIKE 'A%';
                   
--  Q3.)Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
                                                   -- 1500 each. Provide each column an appropriate label.                  
                                                   
	                                      SELECT LAST_NAME , CASE 
                             WHEN SALARY /2 > 10000 THEN (SALARY * 1.10) + 1500
                             ELSE  (SALARY * 1.115)+1500 END AS 'BOUNS AMONT'
                                            FROM EMPLOYEES;
          
-- Q4.) Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the manager name all in Upper case, if the Manager name 
                                                                  -- consists of 'z' replace it with '$!                                                     
                                                   
			SELECT CONCAT(SUBSTRING(EMPLOYEE_ID, 1,2),'00E') AS "MODIFIED EMPLOYEE_ID",
            DEPARTMENT_ID ,UPPER(SALARY),REPLACE(UPPER(MANAGER_ID), 'Z', '$') FROM EMPLOYEES;
                                   
-- Q5.)Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name 
                            -- starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names                                    
                            
                 SELECT CONCAT(UPPER(LEFT(LAST_NAME,1)),LOWER(SUBSTRING(LAST_NAME ,2))),
                      LENGTH(LAST_NAME) FROM EMPLOYEES
                 WHERE LAST_NAME LIKE 'J%' OR LAST_NAME LIKE 'A%' OR LAST_NAME LIKE 'M%' ;
                            
-- Q6.) Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY

             SELECT LAST_NAME,SALARY,LPAD(SALARY ,15,'$')FROM EMPLOYEES; 
             
-- Q7.) Display the employee's name if it is a palindrome .

		SELECT REVERSE(FIRST_NAME) AS EMPLOYEESNAME FROM EMPLOYEES;
        
-- Q8.) Display First names of all employees with initcaps.         

          SELECT CONCAT(UPPER(SUBSTRING(FIRST_NAME,1,1)),LOWER(SUBSTRING(FIRST_NAME,2,5)))FROM EMPLOYEES;        
        
-- Q9). From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.

          SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(STREET_ADDRESS,' ', 2),' ',-1) AS EXTRACT_WORLD FROM LOCATIONS;

-- Q10.) Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address. All characters should 
                                                             -- be in lower case. Display this along with their First Name.
                                                             
            SELECT CONCAT(LOWER(SUBSTRING(FIRST_NAME,1,1)),' ,',LOWER(LAST_NAME),'@SYSTECHUSA.COM') AS EMAIL_ADDRESS FROM EMPLOYEES;                                                 

-- Q11.) Display the names and job titles of all employees with the same job as Trenna. 

			SELECT FIRST_NAME , JOB_ID FROM EMPLOYEES WHERE JOB_ID =
            (SELECT JOB_ID FROM EMPLOYEES WHERE FIRST_NAME="TRENNA");

-- Q12.)  Display the names and department name of all employees working in the same city as Trenna. 
           
             SELECT E.FIRST_NAME AS NAME , D.DEPARTMENT_NAME , L.CITY
             FROM EMPLOYEES E
             JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
             JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
             WHERE L.CITY = 'OXFORD';
           
-- Q13.) Display the name of the employee whose salary is the lowest.

           SELECT FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEES);

-- Q14)Display the names of all employees except the lowest paid

          SELECT FIRST_NAME ,SALARY FROM EMPLOYEES WHERE SALARY > (SELECT MIN(SALARY)FROM EMPLOYEES); 
          
          
                                   -- // ASSIGNMENT IN HR PAGE 32 // -- 

-- Q1). Write a query to display the last name, department number, department name for all employees.

            SELECT EMPLOYEES.LAST_NAME , DEPARTMENTS.DEPARTMENT_ID,DEPARTMENTS.DEPARTMENT_NAME FROM EMPLOYEES
            JOIN 
            DEPARTMENTS ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID;
             
-- Q2). Create a unique list of all jobs that are in department 4. Include the location of the department in the output.
               
          SELECT DISTINCT D.DEPARTMENT_NAME , E.JOB_ID
          FROM EMPLOYEES E
          JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
          WHERE D.DEPARTMENT_ID = '40';
          
            
-- Q3) Write a query to display the employee last name,department name,location id and city of all employees who earn commission.             
            
            SELECT EMPLOYEES.LAST_NAME ,DEPARTMENTS.DEPARTMENT_NAME ,LOCATIONS.LOCATION_ID,LOCATIONS.CITY
            FROM EMPLOYEES
            JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
            JOIN LOCATIONS ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID
            WHERE COMMISSION_PCT IS NOT NULL;
            
-- Q4)Display the employee last name and department name of all employees who have an 'a' in their last name              
            
            SELECT EMPLOYEES.LAST_NAME, DEPARTMENTS.DEPARTMENT_NAME
            FROM EMPLOYEES
            JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
            WHERE LAST_NAME LIKE '%A%';
            
-- Q5) Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA. 

		 SELECT EMPLOYEES.LAST_NAME, EMPLOYEES.JOB_ID, DEPARTMENTS.DEPARTMENT_ID, DEPARTMENTS.DEPARTMENT_NAME
         FROM EMPLOYEES
         JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID 
         WHERE DEPARTMENT_NAME ='ATLANTA';

-- Q6) Display the employee last name and employee number along with their manager's last name and manager number.  
              
          SELECT EMPLOYEES.LAST_NAME, EMPLOYEES.EMPLOYEE_ID, DEPARTMENTS.MANAGER_ID FROM EMPLOYEES
          JOIN
          DEPARTMENTS ON EMPLOYEES.MANAGER_ID = DEPARTMENTS.MANAGER_ID;
              
-- Q7) Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 

		SELECT E1.LAST_NAME, E1.EMPLOYEE_ID, E2.LAST_NAME AS MANAGER_LAST_NAME, E2.EMPLOYEE_ID AS MANAGER_NUMBER
        FROM EMPLOYEES E1
		LEFT JOIN EMPLOYEES E2 ON E1.EMPLOYEE_ID = E2.MANAGER_ID;
        
-- Q8)Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.            
                      
             SELECT E1.LAST_NAME AS EMPLOYEES_LAST_NAME, E1.DEPARTMENT_ID,
                     E2.LAST_NAME AS WORKER_LAST_NAME
                        FROM EMPLOYEES E1
             JOIN EMPLOYEES E2 ON E1.DEPARTMENT_ID = E2.DEPARTMENT_ID
                     WHERE E1.EMPLOYEE_ID = 123
                        ORDER BY E2.LAST_NAME;

-- Q9) Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)

          SELECT E1.FIRST_NAME, E1.JOB_ID, E1.SALARY, D1.DEPARTMENT_NAME,
          CASE 
          WHEN E1.SALARY  >=30000 THEN 'A'
          WHEN E1.SALARY  >=50000 THEN 'B'
          ELSE 'C'
          END AS GRADE
          FROM EMPLOYEES E1
          JOIN DEPARTMENTS D1 ON E1.DEPARTMENT_ID = D1.DEPARTMENT_ID ;
          
-- Q10) Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. Label the columns as Employee 
                                          -- name, emp_hire_date,manager name,man_hire_date.
           
          SELECT E1.FIRST_NAME AS EMPLOYEE_NAME,E1.HIRE_DATE AS EMP_HIRE_DATE, E2.FIRST_NAME AS MANAGER_NAME, E2.HIRE_DATE AS EMP_HIRE_DATE
          FROM EMPLOYEES E1
          JOIN EMPLOYEES E2 ON E1.MANAGER_ID = E2.EMPLOYEE_ID
          WHERE E1.HIRE_DATE < E2.HIRE_DATE;


											-- // ASSIGNMENT IN HR PAGE 34 // --  

-- Q1) Write a query to display the last name and hire date of any employee in the same department as SALES.  

        SELECT EMPLOYEES.LAST_NAME, EMPLOYEES.HIRE_DATE, DEPARTMENTS.DEPARTMENT_NAME
        FROM EMPLOYEES
        JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
        WHERE DEPARTMENTS.DEPARTMENT_ID = 'SALES';
    
-- Q2) . Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary.  

			SELECT LAST_NAME ,EMPLOYEE_ID AS EMPLOYEE_NUMBER , SALARY FROM EMPLOYEES WHERE SALARY > (SELECT AVG(SALARY)FROM EMPLOYEES)
            ORDER BY SALARY ASC;

-- Q3) Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u 

               SELECT EMPLOYEE_ID AS EMPLOYEE_NUMBER , LAST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID IN 
               (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%U%');
               
-- Q4) Display the last name, department number, and job ID of all employees whose department location is ATLANTA.               

        SELECT E.LAST_NAME, DEPARTMENTS.DEPARTMENT_ID AS DEPARTMENT_NUMBER , E.JOB_ID, LOCATIONS.CITY 
        FROM EMPLOYEES E
        JOIN DEPARTMENTS ON E.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
        JOIN LOCATIONS ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID 
        WHERE CITY = "Oxford";
        
-- Q5) Display the last name and salary of every employee who reports to FILLMORE. 
    
       SELECT LAST_NAME , SALARY FROM EMPLOYEES WHERE MANAGER_ID IN (SELECT EMPLOYEE_ID FROM EMPLOYEES WHERE LAST_NAME = "KING");
       
-- Q6) Display the department number, last name, and job ID for every employee in the OPERATIONS department. 
       
        SELECT DEPARTMENT_ID AS DEPARTMENT_NUMBER , LAST_NAME ,JOB_ID FROM EMPLOYEES WHERE DEPARTMENT_ID iN 
        (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = "OPERATIONS");
       
-- Q7) Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any 
                                     -- employee with a 'u'in their name.         
       
       SELECT EMPLOYEE_ID AS EMPLOYEES_NUMBER , LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY >
       (SELECT AVG(SALARY) FROM EMPLOYEES) AND DEPARTMENT_ID IN (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE LAST_NAME LIKE '%U%');

-- Q8)  Display the names of all employees whose job title is the same as anyone in the sales dept. 

        SELECT E.FIRST_NAME , E.LAST_NAME, J.JOB_TITLE , D.DEPARTMENT_NAME
        FROM EMPLOYEES E
        JOIN JOBS J ON E.JOB_ID = J.JOB_ID
        JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
        WHERE DEPARTMENT_NAME = 'SALES';
        
-- Q9) Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
          -- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise.         

                            SELECT Employee_ID, Salary,
                            CASE
                               WHEN Department_id IN (90, 100) THEN Salary * 0.05
                                WHEN Department_id = 100 THEN Salary * 0.10
                                WHEN Department_id IN (60,110) THEN Salary * 0.15
                            ELSE 0
                            END AS RaiseAmount
                            FROM Employees;
		
-- Q10) Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.                                   

            SELECT LAST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 3 ;  
            
-- Q11) Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column              
        
          SELECT FIRST_NAME AS NAME, SALARY,
          CASE
          WHEN COMMISSION_PCT IS NULL THEN '0'
          ELSE COMMISSION_PCT
          END AS COMMISSION_PCT
          FROM EMPLOYEES;

-- Q12) Display the Managers (name) with top three salaries along with their salaries and department information.

           SELECT FIRST_NAME AS MANAGAR_NAME , SALARY AS MANAGAR_SALARY,
           DEPARTMENT_ID AS MANAGAR_DEPARTMENT FROM EMPLOYEES ORDER BY SALARY DESC LIMIT 3;
        
        
                                          -- ASSIGNMENT IN HR PAGE 35 --//          
	
-- Q1) Find the date difference between the hire date and resignation_date for all the employees. Display in no. of days, months and year(1 year 3 months 5 days).
			-- Emp_ID Hire Date Resignation_Date.
		-- 1 1/1/2000 7/10/2013
        -- 2 4/12/2003 3/8/2017
		-- 3 22/9/2012 21/6/2015
         -- 4 13/4/2015 NULL
         -- 5 03/06/2016 NULL
         -- 6 08/08/2017 NULL
           -- 7 13/11/2016  NULL.
           
		SELECT EMPLOYEES.HIRE_DATE, JOB_HISTORY.END_DATE, 
        CONCAT(
        FLOOR(datediff(JOB_HISTORY.END_DATE , EMPLOYEES.HIRE_DATE)/365), 'YEAR',
        FLOOR((datediff(JOB_HISTORY.END_DATE , EMPLOYEES.HIRE_DATE)%365)/30), 'MONTH',
        datediff(JOB_HISTORY.END_DATE , EMPLOYEES.HIRE_DATE)%'30', 'DAYS')AS REGINATIONS
        FROM EMPLOYEES
        JOIN JOB_HISTORY ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;
    
-- Q2). Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900) 
     
         SELECT COALESCE(DATE_FORMAT(EMPLOYEES.HIRE_DATE,  '%M %D %Y'))AS HIRE_DATE, 
         COALESCE(DATE_FORMAT(JOB_HISTORY.END_DATE, '%M %D %Y'),'DEC 01TH 1900') AS END_DATE
         FROM EMPLOYEES
          JOIN JOB_HISTORY ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID;
          
-- Q3) Calcuate experience of the employee till date in Years and months(example 1 year and 3 months)  
			
		SELECT EMPLOYEE_ID ,
        CONCAT
        (FLOOR(DATEDIFF(NOW(), HIRE_DATE) / 365), '  YEAR  ' ,
        FLOOR((DATEDIFF(NOW(), HIRE_DATE) % 365) / 30), ' MONTH '  ) AS EXPERIENCE
	     FROM EMPLOYEES
         WHERE EMPLOYEE_ID;
                
-- Q4) Display the count of days in the previous quarter.
        
        SELECT DATE_ADD(END_DATE,INTERVAL-1 QUARTER)AS PREVIOUS_QUARTER_START_DATE FROM JOB_HISTORY;
	
-- Q5) Fetch the previous Quarter's second week's first day's datE.      
	 
       SELECT DATE_SUB(DATE_ADD(DATE_ADD(END_DATE,INTERVAL -1 QUARTER),
       INTERVAL 14 DAY),INTERVAL 6 DAY)AS "previous Quarter's second week's first day's date" FROM JOB_HISTORY;
       
-- Q6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)*/

       select date_format( '2023-04-01' + interval (15*7) day, '%M %D, %Y') AS WEEK_15TH_FIRSTDAY;
       
-- Q7) Find out the date that corresponds to the last Saturday of January, 2015 using with clause.

       SELECT DATE_FORMAT(DATE_SUB(LAST_DAY('2023-01-01'),INTERVAL 3 DAY),'%W-%y-%m_%d');
        


                
        
        
        
        

