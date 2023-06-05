# Database-Design-Project
Yaşar University - DATABASE SYSTEMS - Final Project

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/813dded7-4314-420c-b816-3e8852bfa648)

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/a4a571f5-b817-40c7-a2d4-9503fe529cf2)

A book can have multiple authors and also an author can write multiple books. Each book must have one publisher, the publisher can publish more than one book. A person can read more than one book, just as a book can be read by more than one person.PeopleRead entity provides the balance between these two entities. PeopleRead is a weak entity because it does not have enough keys to uniquely identify itself. Therefore, it has to get the keys of the entities it is connected to. Also, PeopleRead entity tells us who read which book in what year.
As for the relations, there is a non-identifying relationship between the book and the publisher, because the publisher of a book can change,that means, the foreign key can change. Other relationships must be identifying-relationship because the foreign key can never change. The child entity cannot be uniquely identified without a parent entity.

Query:
a-) Show the author name(s) and surname(s) whose name starts with a given string.

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/904068f1-b269-487b-8e69-ae1e22a5790d)

b-) Show the title of the books written by a given author.

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/c353a6fc-7d22-456c-8265-5e038013db0d)

c-) Show the book title, author name, surname and country, publisher name and address for a given book’s ISBN.

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/397138f0-cfb9-4c5d-90c8-0bfce7186263)

d-) Count how many different people has read a given book.

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/89c6602e-c2c2-497c-bace-de54b4ba7ad0)

e-) Show the name and surname of the author whose books were read the most in a given year.

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/c1d20982-f49a-4fc3-bdf4-263d17720863)

f-) Update the address of a given publisher.

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/072aa7f7-8561-45b3-8516-6ae0ae9bbe16)

g-) Insert a book that a person has read in a specific year. Before insertion, check if the given book
data exists in the DB.

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/6b5d04d3-40bb-428b-b0e6-7501ccf72332)

h-) Delete a person (from all the relevant tables of your DB) who has not read a book for the last 20
years. Make sure to maintain the Referential Integrity.

Before delete:  

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/c7e88316-cac4-4be2-80c2-6b6be1902d0a)

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/88b94003-1b2b-46a4-8552-498a44cb92cc)

DELETE:

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/7bebf08c-e396-46f2-a7da-0245b4f79d75)

AFTER DELETE:

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/b5df0cca-28ae-4dc7-af97-457bbf5e87ba)

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/b0d33c9b-ed1b-4782-8072-101151245ebe)

#GUI:

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/916039e3-ff29-4808-9f4b-e7181a32a1df)

The program will give the results of the query requested from us by clicking the show result button. You will see the outputs of the given query in the table below. You cannot leave the requested value blank. You will get error like that;

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/44b33e21-5415-438e-afcc-f64a15365e52)

a-) 

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/9f865e78-4322-4cec-8156-2c2a8439089b)

b-) 

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/fe2f890d-c852-4064-a2eb-7d4539fe537c)

c-) 

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/36fda640-1636-44b9-9099-62bf675ca311)

d-) 

![image](https://github.com/barkinkoroglu/Database-Design-Project/assets/54675420/ce43ca82-f682-4277-aea4-684baffc6274)








