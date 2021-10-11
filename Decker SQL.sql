DROP TABLE student;
DROP TABLE course;
Drop Table grade;

CREATE TABLE student 
(
studentSSN 			INTEGER(4) PRIMARY KEY,
studentSName 		VARCHAR(25),
studentMajor		VARCHAR(2) 
); 

CREATE TABLE course
(
courseCNO			VARCHAR(3) PRIMARY KEY,
courseCName			VARCHAR(3),
courseCreditHour	INTEGER(1)
);

CREATE TABLE grade
(
gradeSSN			INTEGER REFERENCES student(studentSSN),
gradeCNO			VARCHAR REFERENCES course(courseCNO),
gradeGPA			INTEGER(1)
);

INSERT INTO student (studentSSN, studentSName, studentMajor) VALUES (1234, 'Smith', 'CS');
INSERT INTO student (studentSSN, studentSName, studentMajor) VALUES (2345, 'Jones', 'CS');
INSERT INTO student (studentSSN, studentSName, studentMajor) VALUES (3456, 'Williams', 'IT');

INSERT INTO course (courseCNO, courseCName, courseCreditHour) VALUES ('001', 'CS1', 2); 
INSERT INTO course (courseCNO, courseCName, courseCreditHour) VALUES ('002', 'CS2', 3);
INSERT INTO course (courseCNO, courseCName, courseCreditHour) VALUES ('003', 'CS3', 4);  

INSERT INTO grade (gradeSSN, gradeCNO, gradeGPA) VALUES (1234, '001', 4); 
INSERT INTO grade (gradeSSN, gradeCNO, gradeGPA) VALUES (1234, '002', 3);
INSERT INTO grade (gradeSSN, gradeCNO, gradeGPA) VALUES (1234, '003', 4);
INSERT INTO grade (gradeSSN, gradeCNO, gradeGPA) VALUES (2345, '001', 4);
INSERT INTO grade (gradeSSN, gradeCNO, gradeGPA) VALUES (2345, '003', 3);
INSERT INTO grade (gradeSSN, gradeCNO, gradeGPA) VALUES (3456, '002', 3);
INSERT INTO grade (gradeSSN, gradeCNO, gradeGPA) VALUES (3456, '003', 4); 


SELECT studentSName AS Student_Name, avg(gradeGPA) AS GPA FROM grade
	JOIN student ON grade.gradeSSN = student.studentSSN
    JOIN course ON grade.gradeCNO = course.courseCNO
    
 	Group by studentSName
    OrDER BY studentSName DESC
	