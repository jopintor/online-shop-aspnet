# Online Shop – ASP.NET Web Forms E-commerce App

A role-based online store built with **C#, ASP.NET Web Forms (.NET Framework 4.7.2) and SQL Server LocalDB**. Customers can browse products, manage a cart, check out with membership discounts and view receipts. Admins can manage products and see users and transactions.

> Team project for an application development course (BIT, 2nd year, 2025).
> Team: Pintor, Dela Peña, Kim. *(Add full names and GitHub links.)*

<!-- Add screenshots here, e.g. ![Shop home](docs/screenshots/home.png) -->

## Features

**Customers**
- Register, log in and log out. Passwords are validated (8+ characters, at least one number).
- Browse products and add them to a cart. The cart won't let you add more than the available stock.
- Checkout with 10% tax, plus a membership discount on orders over ₱10,000.
- A receipt with a unique sale code, plus full order history.
- Profile page and password change.

**Admins**
- Create, edit and delete products and their stock.
- View all registered users.
- View transactions per user and per sale.

**Under the hood**
- **Layered design:** the web project (`PintorDelapenaKimSummative`) only talks to a separate class library (`DataAccess`). All SQL goes through **stored procedures with typed parameters**, which prevents SQL injection.
- **Role-based access:** separate master pages (`Admin.Master`, `User.Master`, `Main.Master`) check the session role, so customers can't open admin pages and vice versa.
- **Password security:** passwords are stored as salted **PBKDF2-SHA256** hashes (`DataAccess/PasswordHasher.cs`). Older plain-text accounts are upgraded to a hash the first time they log in.
- **Stock control:** stock is checked and reduced when a transaction is saved.

## Project structure

```
PintorDelapenaKimSummative.sln
├── DataAccess/                  Class library: database calls + password hashing
│   ├── DataHandler.cs
│   └── PasswordHasher.cs
└── PintorDelapenaKimSummative/  ASP.NET Web Forms site
    ├── Main/    Public pages: Home, Login, Register, Logout
    ├── User/    Customer pages: Home (shop), ViewCart, Receipt, ViewTransactions, Profile, ChangePassword
    ├── Admin/   Admin pages: Products, CreateProduct, EditProduct, Users, Transactions
    └── App_Data/MasterFile.mdf   SQL Server LocalDB database (tables + stored procedures)
```

## Running it locally

**Requirements:** Windows, Visual Studio 2022 with the *ASP.NET and web development* workload (includes IIS Express and SQL Server Express LocalDB).

1. Clone the repository and open `PintorDelapenaKimSummative.sln`.
2. Set `PintorDelapenaKimSummative` as the startup project.
3. Press **F5**.

> **Note:** the database file (`App_Data/MasterFile.mdf`) is not included in this repository because it held real user data from the class project. The app expects a LocalDB database with the tables and stored procedures that `DataAccess/DataHandler.cs` calls (accounts, products, cart and transactions), connected through the `MasterFile` connection string in `Web.config`.

## Tech stack

C# · ASP.NET Web Forms · .NET Framework 4.7.2 · SQL Server LocalDB · T-SQL stored procedures · HTML/CSS
