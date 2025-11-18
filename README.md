Car Rental Management System (JSP + MySQL)

This is a Car Rental Management System developed using JSP, JDBC, HTML, CSS, JavaScript, and MySQL.
It allows users to search for available cars, book vehicles, and also provides an admin module to manage vehicles.

📌 Features
👤 User Features

View available vehicles
Check availability based on date range
Book cars online
Automatic rent calculation
Booking confirmation page

🔐 Admin Features

Admin login
Add new vehicles
Delete vehicles
View all vehicles
Manage availability

🗄 Database Structure
car Table
Field	Description
id	Car ID (Primary Key)
car_name	Car name
car_model	Model name
rent_per_day	Rent per day
seats	Number of seats
fuel_type	Fuel type
num_vehicles	Total number of vehicles
availability	Available / Booked
booking Table
Field	Description
id	Booking ID
customer_name	Customer name
customer_email	Email ID
customer_phone	Phone
license_number	License number
car_name	Booked car name
rent_per_day	Rent per day
start_date	Booking start
end_date	Booking end
total_rent	Total calculated rent

🛠 Technologies Used

JSP (Java Server Pages)
HTML, CSS, JavaScript
Apache Tomcat Server
JDBC
MySQL Database

🚀 How to Run the Project

Install Apache Tomcat
Install MySQL and create database
Import the SQL tables (car & booking)
Configure DB connection in connection.jsp
Place the project folder inside:

/webapps/


Run Tomcat and open:
http://localhost:8080/CarRental/
