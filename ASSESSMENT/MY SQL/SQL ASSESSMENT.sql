                         	-- // -- ASSESSMENT PART 1 --  //
             
-- Q1.  Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
         -- Ascending and DEPARTMENT Descending.
         
                          SELECT * FROM WORKER ORDER BY
                            FIRST_NAME ASC, DEPARTMENT DESC;


-- Q2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” 
                         -- from the Worker table.
                         
                              SELECT * FROM WORKER WHERE 
                       FIRST_NAME='VIPUL' OR FIRST_NAME='SATISH';
                       
                       
-- Q3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
                          -- contains six alphabets.  

                               SELECT * FROM WORKER 
                             WHERE FIRST_NAME LIKE '_H';
                      
-- Q4. Write an SQL query to print details of the Workers whose SALARY lies between 1. 
                       
                            SELECT * FROM WORKER
                    WHERE SALARY BETWEEN 100000 AND 500000 ;
                    
                    
-- Q5.  Write an SQL query to fetch duplicate records having matching data in some fields of a table
             
                    SELECT SALARY, DEPARTMENT, COUNT(*)
                           FROM WORKER
                      GROUP BY SALARY, DEPARTMENT
                           HAVING COUNT(*)>1;
    
-- Q6. Write an SQL query to show the top 6 records of a table.
      
                      SELECT * FROM WORKER 
			            	LIMIT 6;
                            
-- Q7  Write an SQL query to fetch the departments that have less than five people in them.                             
     
                     SELECT DEPARTMENT,COUNT(*)AS
                           TOTAL_PEOPLE
                            FROM WORKER 
                   GROUP BY DEPARTMENT HAVING COUNT(*)<5; 
                   
-- Q8. Write an SQL query to show all departments along with the number of people in there.

                     SELECT DEPARTMENT, COUNT(FIRST_NAME)
                       AS WORKER_STRENGTH FROM WORKER
                     GROUP BY DEPARTMENT ORDER BY DEPARTMENT ASC;

-- Q9. Write an SQL query to print the name of employees having the highest salary in each department. 
         
			     SELECT FIRST_NAME,DEPARTMENT, SALARY FROM WORKER WHERE SALARY 
				IN (SELECT MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT);





                           -- // ASSESSMENT PART 2 // -- 
                       
-- Q2: Open school database, then select student table and use following SQL statements.

        -- (1). To display all the records form STUDENT table.\

                        SELECT * FROM STUDENT;
            
        -- (2).To display any name and date of birth from the table STUDENT.
                  
                  SELECT STD_NAME,DOB FROM STUDENT;

		-- (3).To display all students record where percentage is greater of equal to 80 FROM student table. 
        
                         SELECT * FROM student WHERE percentage >= 80;
                         
        -- (4).To display student name, stream and percentage where percentage of student is more than 80 .
        
                           SELECT StdName, Stream, Percentage
                                  WHERE percentage > 80; 
                       
        -- (5).To display all records of science students whose percentage is more than 75 form student table. 
        
                               SELECT * FROM STUDENT
                       WHERE STREAM = 'SCIENCE' AND PERCENTAGE >= 75 ;


 






























                   

                        
                        
                        
                                     
