# BankingAPI

BankingAPI is a simple RESTful API built with Elixir and Phoenix Framework for managing bank accounts. It provides full CRUD operations on accounts and is backed by a PostgreSQL database.

## Features

- Create, read, update, and delete bank accounts
- JSON API following RESTful conventions
- Built-in input validation with Ecto changesets
- Error handling with FallbackController
- PostgreSQL integration via Ecto

## Requirements

- Elixir >= 1.14
- Erlang/OTP >= 25
- PostgreSQL >= 14
- Phoenix >= 1.7

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your_username/banking_api.git
cd banking_api
```
### 2. Install dependencies
```bash
mix deps.get
```
### 3. Set up the database
Edit `config/dev.exs` to match your local PostgreSQL credentials, then run:
```bash
mix ecto.create
mix ecto.migrate
```
### 4. Run the Phoenix server
```bash
mix phx.server
```
Now visit `http://localhost:4000` in your browser or API client.
## API Endpoints
All endpoints accept and return JSON.
| Method | Endpoint           | Description          |
| ------ | ------------------ | -------------------- |
| GET    | /api/accounts      | List all accounts    |
| GET    | /api/accounts/\:id | Get a single account |
| POST   | /api/accounts      | Create a new account |
| PUT    | /api/accounts/\:id | Update an account    |
| DELETE | /api/accounts/\:id | Delete an account    |
### Example Request (Create)
```bash
POST /api/accounts
Content-Type: application/json

{
  "account": {
    "name": "Petri",
    "balance": 1000
  }
}
```
### Example Response
```bash
{
  "id": 1,
  "name": "Petri",
  "balance": 1000
}
```
## Development Tips
- Use `mix phx.routes` to see all available routes
- Use `iex -S mix` for an interactive console
- Use `curl` or Postman for testing API endpoints
