-- Database creation session
create database simple_university;
use database simple_university;
create table Student (
    Id int unsigned auto_increment primary key,
    Firstname varchar(20) not null,
    Lastname varchar(20) not null,
    password varchar(20) not null
);
create table Course (
    Id int(6) unsigned auto_increment primary key,
    Name varchar(20) not null,
    Description varchar(20)
);
create table Lesson (
    Id int unsigned auto_increment primary key,
    Name varchar(20) not null,
    Description varchar(20),
    CourseId int unsigned,
    foreign key (CourseId) references Course(Id)
);
create TABLE StudentsCourses (
    Id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    StudentId INT UNSIGNED,
    CourseId INT UNSIGNED,
    foreign key (StudentId) REFERENCES Student(Id),
    foreign key (CourseId) REFERENCES Course(Id)
);

-- Filling db
insert INTO Student (Firstname, Lastname, password) 
VALUES
    ('Max', 'Peterson', '123aaabbb'),
    ('Peter', 'Parker', '2256884'),
    ('Kate', 'Jackson', '8745777');

insert into Course (Name, Description)
VALUES 
    ('Course 1', 'Very good course'),
    ('Course 2', null),
    ('Course 3', null);

insert into Lesson (Name, Description, CourseId)
VALUES 
    ('Lesson 1', NULL, 1),
    ('Lesson 2', NULL, 2),
    ('Lesson 3', NULL, 1),
    ('Lesson 1', NULL, 3),
    ('Lesson 2', 'description', 1),
    ('Lesson 3', NULL, 3);

insert into StudentsCourses (StudentId, CourseId)
values 
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 3);

select Student.Firstname, Student.Lastname, Lesson.Id, Lesson.Name
from Student
join StudentsCourses on StudentsCourses.StudentId = Student.Id
join Course on Course.Id = StudentsCourses.CourseId
join Lesson on Lesson.CourseId = Course.Id
where Lesson.Id = 1 order by Student.Firstname desc;