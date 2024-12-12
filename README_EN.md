# Emergency Service Dashboard | Backend
Панель оператора системы-112 | Бэкенд ([RU](./README.md))

---

**112 System** is a unified emergency assistance service for crisis situations. 
It is available 24/7 and free of charge from any phone, often even without a network signal. 
Calls are answered by an operator who clarifies the reason for the call and coordinates further assistance. 
The system operates in many CIS and European countries.

This repository contains the backend for the emergency service operator dashboard, developed as an educational project. 
It implements a basic REST API for database interaction and integrates with a geocoding service. 
One of the project goals is SQL database design, which is why neither ORMs nor NoSQL databases are used here.

The frontend is in a separate repository: [emergency_service_front](https://github.com/k0ndrateff/emergency_service_front).

## Features Implemented

- **Incident management**;
- **Crew management**;
- **Operator management**;
- **Geocoding**.

## Tech Stack

- **Server Framework**: [Express.js](https://expressjs.com/);
- **Database**: [PostgreSQL](https://www.postgresql.org/);
- **Controllers**: [routing-controllers](https://github.com/typestack/routing-controllers);
- **Geocoding**: [DaData](https://dadata.ru/) _(only russian)_.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/k0ndrateff/emergency_service_back.git
   cd emergency_service_back
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Set up environment variables:
    - Configure the connection to your PostgreSQL database.
    - Obtain a token from the DaData service and set it as the `DADATA_TOKEN` variable.

4. Set up the database:
    - The database dump with the required schema and initial data is in the `db.sql` file:
      ```bash
      pg_restore db.sql
      ```

5. Start the server:
   ```bash
   npm run dev
   ```

## Feedback and Suggestions

Feedback and suggestions are welcome in the `Issues` section!

## Links and References

- Some ideas for designing this system were inspired by the existing 112 System: [Wikipedia](https://en.wikipedia.org/wiki/112_(emergency_telephone_number))
