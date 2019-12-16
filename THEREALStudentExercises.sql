--CREATE TABLE Cohort (
-- Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
-- CohortName VARCHAR (55) NOT NULL);

--CREATE TABLE Student (
--Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
--FirstName VARCHAR(55) NOT NULL,
--LastName VARCHAR(55) NOT NULL,
--SlackHandle VARCHAR(55) NOT NULL,
--CohortId INTEGER NOT NULL
--CONSTRAINT FK_Student_Cohort FOREIGN KEY(CohortId) REFERENCES Cohort(Id));

 
----CREATE TABLE Instructor (
----Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
----FirstName VARCHAR(55) NOT NULL,
----LastName VARCHAR(55) NOT NULL, 
----SlackHandle VARCHAR (55) NOT NULL,
----Specialty  VARCHAR (55) NOT NULL,
----CohortId INTEGER NOT NULL
----CONSTRAINT FK_Instructor_Cohort FOREIGN KEY (CohortId) REFERENCES Cohort(Id));

--CREATE TABLE Exercise (
--Id INTEGER NOT NULL PRIMARY KEY IDENTITY,	
--ExerciseName VARCHAR (55) NOT NULL,
--ProgrammingLanguage VARCHAR (55) NOT NULL);

CREATE TABLE StudentExercise (
Id INTEGER NOT NULL PRIMARY KEY IDENTITY,
StudentId INTEGER NOT NULL, 
ExerciseId INTEGER NOT NULL,
CONSTRAINT FK_StudentExercise_StudentId FOREIGN KEY (StudentId) REFERENCES Student(Id),
CONSTRAINT FK_StudentExercise_ExerciseId FOREIGN KEY (ExerciseId) REFERENCES Exercise(Id));


---- Students

--INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Big Dave', 'Cornish', 'Big Dave Cornish', 1);
--INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Fratello', 'Mugnano', 'Fratello Mugnano', 2);
--INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('DylPickle', 'Gurifusu', 'DylPickleGurifusu', 3);
--INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('George K', 'Williamson', 'George K Williamson', 1);
--INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('TroopLeader', 'Lauren', 'TroopLeader Lauren', 2);
--INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Ye Olde', 'Spradlin', 'Ye Olde Spradlin', 3);
--INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('James', 'McClarty', 'James McClarty', 1);
--INSERT INTO Student (FirstName, LastName, SlackHandle, CohortId) VALUES ('Aryn', 'with an A and a Y', 'Aryn with an A and Y', 2);

---- Cohorts

--INSERT INTO Cohort (CohortName) VALUES (31);
--INSERT INTO Cohort (CohortName) VALUES (32);
--INSERT INTO Cohort (CohortName) VALUES (33);
--INSERT INTO Cohort (CohortName) VALUES (34);
--INSERT INTO Cohort (CohortName) VALUES (35);
--INSERT INTO Cohort (CohortName) VALUES (36);

---- Instructors

INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES ('Adam', 'Sheaffer', 'Adam Sheaffer', 'Back End', 35);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES ('Brenda', 'Long', 'Brenda Long', 'Front End', 33);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES ('Madi', 'Pepper', 'Madi Pepper', 'JIing', 34);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES ('Mo', 'Silvera', 'Mo Silvera', 'Communicating', 37);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES ('Jisie', 'David', 'Jisie David', 'Python', 36);
INSERT INTO Instructor (FirstName, LastName, SlackHandle, Specialty, CohortId) VALUES ('Rose', 'Wisotsky', 'Rose Wisotsky', 'Being Funny', 36);

---- Exercises

INSERT INTO Exercise (ExerciseName, ProgrammingLanguage) VALUES ('The Chase', 'Python');
INSERT INTO Exercise (ExerciseName, ProgrammingLanguage) VALUES ('The Heist', 'C Sharp');
INSERT INTO Exercise (ExerciseName, ProgrammingLanguage) VALUES ('Nutshell', 'Javascript');
INSERT INTO Exercise (ExerciseName, ProgrammingLanguage) VALUES ('The Ramenator', 'React');
INSERT INTO Exercise (ExerciseName, ProgrammingLanguage) VALUES ('Welcome To Nashville', 'Javascript');
INSERT INTO Exercise (ExerciseName, ProgrammingLanguage) VALUES ('Trestlebridge', 'C Sharp');

---- Assign Exercises

INSERT INTO StudentExercises (StudentId, ExerciseId) VALUES (1, 2);
INSERT INTO StudentExercises (StudentId, ExerciseId) VALUES (2, 3);
INSERT INTO StudentExercises (StudentId, ExerciseId) VALUES (3, 1);
INSERT INTO StudentExercises (StudentId, ExerciseId) VALUES (4, 4);
INSERT INTO StudentExercises (StudentId, ExerciseId) VALUES (5, 1);
INSERT INTO StudentExercises (StudentId, ExerciseId) VALUES (6, 5);
INSERT INTO StudentExercises (StudentId, ExerciseId) VALUES (7, 6);
INSERT INTO StudentExercises (StudentId, ExerciseId) VALUES (8, 2);

--write a query to return all student first and last names with cohort name

SELECT s.FirstName, s.LastName, c.CohortName FROM Student s LEFT JOIN Cohort c on s.CohortId = c.Id;

--Write a query to return student first and last names with their cohort's name only for a single cohort

SELECT s.FirstName, s.LastName, c.CohortName FROM Student s LEFT JOIN Cohort c on s.CohortId = c.Id WHERE c.Id = 2;

-- Write a query to return all instructors ordered by their last name

SELECT FirstName, LastName FROM Instructor ORDER BY LastName;

--Write a query to return a list of unique instructor specialties

SELECT DISTINCT Specialty
FROM Instructor;

-- Write a query to return a list of all student names along with the names of the exercises they have been assigned. If an exercise has not been assigned, it should not be in the result.

-- SELECT s.FirstName, s.LastName, e.ExerciseName FROM StudentExercises se INNER JOIN Students s on se.StudentId = s.Id
-- INNER JOIN Exercises e on se.ExerciseId = e.Id;

-- Return a list of student names along with the count of exercises assigned to each student.

-- SELECT COUNT (se.Exercise.Id) NumberOfExercises, s.FirstName, s.LastName FROM StudentExercises.se 
-- INNER JOIN Students s on se.StudentId = s.Id
-- GROUP BY s.FirstName, s.LastName;