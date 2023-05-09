USE `mydb` ;

-- Insert Publisher
INSERT INTO Publisher(idPublisher, PubName, Adress)
VALUES(1,'Pubname1','Address1');
INSERT INTO Publisher(idPublisher, PubName, Adress)
VALUES(2,'Pubname2','Address2');
INSERT INTO Publisher(idPublisher, PubName, Adress)
VALUES(3,'Pubname3','Address3');
INSERT INTO Publisher(idPublisher, PubName, Adress)
VALUES(4,'Pubname4','Address4');
INSERT INTO Publisher(idPublisher, PubName, Adress)
VALUES(5,'Pubname5','Address5');

Select * from Publisher;


-- Insert Author
INSERT INTO Author(idAuthor, Name, Surname, Gender, Birthdate, Country)
VALUES(1,'Author1Name','Author1Surname','F','1975-06-23','Turkey');
INSERT INTO Author(idAuthor, Name, Surname, Gender, Birthdate, Country)
VALUES(2,'Author2Name','Author2Surname','M','1995-11-26','France');
INSERT INTO Author(idAuthor, Name, Surname, Gender, Birthdate, Country)
VALUES(3,'Author3Name','Author3Surname','F','1981-03-08','Germany');
INSERT INTO Author(idAuthor, Name, Surname, Gender, Birthdate, Country)
VALUES(4,'Author4Name','Author4Surname','M','1961-05-08','Greece');
INSERT INTO Author(idAuthor, Name, Surname, Gender, Birthdate, Country)
VALUES(5,'Author5Name','Author5Surname','F','1986-03-29','Poland');

SELECT * from  Author;

-- Insert Book Tuples
INSERT INTO Book(ISBN, Title, Category, NofPages, Publisher_idPublisher)
VALUES('1','Book1','Category1','126',1);
INSERT INTO Book(ISBN, Title, Category, NofPages, Publisher_idPublisher)
VALUES('2','Book2','Category1','255',2);
INSERT INTO Book(ISBN, Title, Category, NofPages, Publisher_idPublisher)
VALUES('3','Book3','Category2','145',2);
INSERT INTO Book(ISBN, Title, Category, NofPages, Publisher_idPublisher)
VALUES('4','Book4','Category1','465',3);
INSERT INTO Book(ISBN, Title, Category, NofPages, Publisher_idPublisher)
VALUES('5','Book5','Category3','564',3);
SELECT * FROM Book;


-- Insert People
INSERT INTO People(idPeople, PeopName, PeopSurname, PeopBirthDate)
VALUES(1,'PeopleName1','PeopleSurname1','1999-03-09');
INSERT INTO People(idPeople, PeopName, PeopSurname, PeopBirthDate)
VALUES(2,'PeopleName2','PeopleSurname2','1999-11-22');
INSERT INTO People(idPeople, PeopName, PeopSurname, PeopBirthDate)
VALUES(3,'PeopleName3','PeopleSurname3','2001-01-15');
INSERT INTO People(idPeople, PeopName, PeopSurname, PeopBirthDate)
VALUES(4,'PeopleName4','PeopleSurname4','1998-10-19');
INSERT INTO People(idPeople, PeopName, PeopSurname, PeopBirthDate)
VALUES(5,'PeopleName5','PeopleSurname5','1996-02-22');
INSERT INTO People(idPeople, PeopName, PeopSurname, PeopBirthDate)
VALUES(6,'PeopleName6','PeopleSurname6','1986-05-17');
SELECT * from  People;

-- Insert PeopleRead
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(2020,1,'1');
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(2020,1,'3');
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(2021,1,'5');
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(2020,2,'1');
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(2019,3,'4');
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(2019,3,'3');
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(2020,4,'1');
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(2017,4,'2');
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(2015,4,'4');
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(2016,5,'1');
INSERT INTO PeopleRead(Year, People_idPeople, Book_ISBN)
VALUES(1995,6,'1');
SELECT * from  PeopleRead;

-- Insert AuthorWrite
INSERT INTO AuthorWrite(Author_idAuthor, Book_ISBN)
VALUES(1,'1');
INSERT INTO AuthorWrite(Author_idAuthor, Book_ISBN)
VALUES(1,'2');
INSERT INTO AuthorWrite(Author_idAuthor, Book_ISBN)
VALUES(2,'3');
INSERT INTO AuthorWrite(Author_idAuthor, Book_ISBN)
VALUES(2,'4');
INSERT INTO AuthorWrite(Author_idAuthor, Book_ISBN)
VALUES(3,'5');
SELECT * from AuthorWrite;

-- a-) Show the author name(s) and surname(s) whose name starts with a given string.
SELECT Name,Surname from mydb.author where Name like 'Author3%';

-- b-) Show the title of the books written by a given author.

Select title from mydb.Author,mydb.AuthorWrite,mydb.Book where idAuthor = Author_idAuthor AND AuthorWrite.Book_ISBN = Book.ISBN AND Name Like 'Author1%';

-- c-) Show the book title, author name, surname and country, publisher name and address for a given book’s ISBN.

Select title,author.name, author.surname, author.country, PubName, Adress  from mydb.Book, mydb.Publisher,mydb.Author, mydb.AuthorWrite 
where idAuthor = Author_idAuthor AND 
AuthorWrite.Book_ISBN = Book.ISBN AND Publisher_idPublisher = idPublisher AND  ISBN = '1';

-- d-) Count how many different people has read a given book.
SELECT COUNT(*) from PeopleRead where Book_ISBN = '1';

-- e-) Show the name and surname of the author whose books were read the most in a given year.

Select Name,Surname from Author,AuthorWrite,(select Book_ISBN , count(*) from PeopleRead where year ='2017' 
group by Book_ISBN order by count(*) desc LIMIT 1)c 
where c.Book_ISBN=AuthorWrite.Book_ISBN AND Author_idAuthor = Author.idAuthor;
-- f-) Update the address of a given publisher
UPDATE Publisher SET Adress = 'PubnameNew' where idPublisher = 5;
Select * from Publisher;

-- g-) Insert a book that a person has read in a specific year. Before insertion, check if the given book data exists in the DB.
INSERT INTO Book(ISBN, Title, Category, NofPages, Publisher_idPublisher)
SELECT * FROM (SELECT '6','Book6','Category2','211',3) AS tmp
WHERE NOT EXISTS ( 
SELECT ISBN from Book WHERE ISBN = '6'
);

Select * from book;

-- h. Delete a person (from all the relevant tables of your DB) who has not read a book for the last 20 years. Make sure to maintain the Referential Integrity
Select * from people;
Select * from Peopleread;

DELETE FROM People WHERE idPeople = ( SELECT People_idPeople from PeopleRead 
group by People_idPeople having max(year) <(YEAR(CURRENT_DATE())-20));

Select * from people;
Select * from Peopleread;
