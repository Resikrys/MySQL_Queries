# 📘 SQL Queries 

## 📄 Description – Exercise Statement
### Store DDBB

We have the tables product and manufacturer, each with the following fields:
- product (code, number, price, manufacturer_code)
- manufacturer (code, number)
The field 'manufacturer_code' of the product entity is related to the field 'code' of the manufacturer entity.
Please perform the following queries:

- List the name of all the products in the product table.
- List the names and prices of all the products in the product table.
- List all the columns in the product table.
- List the name of the products, the price in euros and the price in US dollars (USD).
- List the name of the products, the price in euros and the price in US dollars (USD). Use the following aliases for the columns: product_name, euros, dollars.
- List the names and prices of all the products in the product table, converting the names to uppercase.
- Lists the names and prices of all products in the product table, converting the names to lowercase.
- Lists the names of all manufacturers in one column, and in another column, obtains the first two characters of the manufacturer's name in uppercase.
- Lists the names and prices of all products in the product table, rounding the price value.
- Lists the names and prices of all products in the product table, truncating the price value to display it without any decimal places.
- Lists the code of the manufacturers that have products in the product table.
- Lists the code of the manufacturers that have products in the product table, eliminating the codes that appear repeatedly.
- Lists the names of the manufacturers sorted in ascending order.
- Lists the names of the manufacturers sorted in descending order.
- Lists the names of the products sorted, first by name in ascending order and, second, by price in descending order.
- Returns a list with the first 5 rows of the manufacturer table.
- Returns a list with 2 rows starting from the fourth row of the manufacturer table. The fourth row must also be included in the response.
- Lists the name and price of the cheapest product. (Uses only ORDER BY and LIMIT clauses). NOTE: You could not use MIN(price) here, you would need GROUP BY.
- Lists the name and price of the most expensive product. (Uses only ORDER BY and LIMIT clauses). NOTE: You could not use MAX(price) here, you would need GROUP BY.
- Lists the name of all products from the manufacturer whose manufacturer code is equal to 2.
- Returns a list with the product name, price and manufacturer name of all products in the database.
- Returns a list with the product name, price and manufacturer name of all products in the database. Sorts the result by manufacturer name, in alphabetical order.
- Returns a list with the product code, product name, manufacturer code and manufacturer name, of all the products in the database.
- Returns the product name, its price and the name of its manufacturer, of the cheapest product.
- Returns the product name, its price and the name of its manufacturer, of the most expensive product.
- Returns a list of all the products of the manufacturer Lenovo.
- Returns a list of all the products of the manufacturer Crucial that have a price greater than 200€.
- Returns a list with all the products of the manufacturers Asus, Hewlett-Packard and Seagate. Without using the IN operator.
- Returns a list with all the products of the manufacturers Asus, Hewlett-Packard and Seagate. Using the IN operator.
- Returns a list with the name and price of all the products of the manufacturers whose name ends with the vowel e.
- Returns a list with the name and price of all the products whose manufacturer name contains the character w in its name.
- Returns a list with the product name, price and manufacturer name, of all products that have a price greater than or equal to €180. Sorts the result, first, by price (in descending order) and, second, by name (in ascending order).
- Returns a list with the code and manufacturer name, only of those manufacturers that have associated products in the database.
- Returns a list of all manufacturers that exist in the database, along with the products that each of them has. The list must also show those manufacturers that do not have associated products.
- Returns a list where only those manufacturers that do not have any associated products appear.
- Returns all products from the manufacturer Lenovo. (Without using INNER JOIN).
- Returns all data from products that have the same price as the most expensive product from the manufacturer Lenovo. (Without using INNER JOIN).
- Lists the name of the most expensive product from the manufacturer Lenovo.
- Lists the name of the cheapest product from the manufacturer Hewlett-Packard.
- Returns all products in the database that have a price greater than or equal to the most expensive product from the manufacturer Lenovo.
- Lists all products from the manufacturer Asus that have a price greater than the average price of all their products.

### University DDBB

Download the database from the file schema_universidad.sql, view the E-R diagram in an editor and perform the following queries:

- Return a list with the first surname, middle surname and first name of all students. The list must be sorted alphabetically from lowest to highest by first surname, middle surname and first name.
- Find out the name and both surnames of students who have not registered their telephone number in the database.
- Return the list of students who were born in 1999.
- Return the list of teachers who have not registered their telephone number in the database and whose NIF ends in K.
- Return the list of subjects taught in the first semester, in the third year of the degree that has the identifier 7.
- Return a list of teachers along with the name of the department to which they are linked. The list must return four columns, first surname, second surname, first name and department name. The result will be sorted alphabetically from lowest to highest by surname and first name.
- Returns a list with the name of the subjects, start year and end year of the school year of the student with NIF 26902806M.
- Returns a list with the name of all the departments that have professors who teach a subject in the Degree in Computer Engineering (2015 Plan).
- Returns a list with all the students who have enrolled in a subject during the 2018/2019 school year.
- Solve the following 6 queries using the LEFT JOIN and RIGHT JOIN clauses.

- Returns a list with the names of all the professors and the departments they are linked to. The list must also show those professors who do not have any associated department. The list should return four columns, department name, first last name, second last name and teacher's name. The result will be sorted alphabetically from lowest to highest by department name, last name and first name.
- Returns a list of teachers who are not associated with a department.
- Returns a list of departments that do not have associated teachers.
- Returns a list of teachers who do not teach any subjects.
- Returns a list of subjects that do not have a teacher assigned.
- Returns a list of all departments that have not taught subjects in any school year.

Summary queries:

- Returns the total number of students.
- Calculates how many students were born in 1999.
- Calculates how many teachers there are in each department. The result should only show two columns, one with the name of the department and another with the number of professors in that department. The result should only include departments that have associated professors and should be sorted from highest to lowest by the number of professors.
- Returns a list with all departments and the number of professors in each of them. Keep in mind that there may be departments that do not have associated professors. These departments should also appear in the list.
- Returns a list with the name of all the degrees in the database and the number of subjects that each one has. Keep in mind that there may be degrees that do not have associated subjects. These degrees should also appear in the list. The result should be sorted from highest to lowest by the number of subjects.
- Returns a list with the name of all the degrees in the database and the number of subjects that each one has, of the degrees that have more than 40 associated subjects.
- Returns a list that shows the name of the degrees and the sum of the total number of credits that exist for each type of subject. The result must have three columns: name of the degree, type of subject and the sum of the credits of all the subjects that exist of this type.
- Returns a list that shows how many students have enrolled in a subject in each of the school years. The result must show two columns, one column with the start year of the school year and another with the number of students enrolled.
- Returns a list with the number of subjects that each teacher teaches. The list must take into account those teachers who do not teach any subject. The result will show five columns: id, name, first name, second name and number of subjects. The result will be sorted from highest to lowest by the number of subjects.
- Returns all the data of the youngest student.
- Returns a list of teachers who have an associated department and who do not teach any subjects.

## 💻 Technologies Used

- MySQL
- MySQL Workbench
- Docker
- Git & GitHub

## 📋 Requirements

- MySQL 8.0+ installed locally
- MySQL Workbench or another SQL client
- Git for version control
- Text/code editor (e.g., VS Code)

## 🛠️ Installation

1. Clone the repository:
   ```
   git clone https://github.com/Resikrys/MySQL_Structure
   ```
2. Open the project folder.
3. Open the `.sql` files using your SQL client.
4. Run the creation and insertion scripts in the correct order.

## ▶️ Execution

- Execute docker image to run localhost
- Execute MySQL Workbench localhost ddbb or your preferred MySQL client.
- Execute the provided `.sql` scripts in MySQL Workbench or your preferred MySQL client.
- Use the `INSERT` statements to populate the tables.
- Run the example queries to verify the database is correctly populated and relational constraints work.

## 🌐 Deployment

This project is designed for local execution only. No online or production deployment is required.
