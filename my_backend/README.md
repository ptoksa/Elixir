# MyBackend

MyBackend is a simple Elixir backend application built using the Phoenix web framework. It provides CRUD (Create, Read, Update, Delete) operations for managing users.

![Listing_users](assets/Listing_users.jpg)
![New_user](assets/New_user.jpg)

## Features

The application allows you to perform the following actions for managing users:

* `Create:` Add a new user.
* `Read:` View a list of users and see details of a specific user.
* `Update:` Modify existing user details.
* `Delete:` Remove a user from the list.

You can interact with the user management interface by visiting [`localhost:4000/users`](http://localhost:4000/users) in your web browser.

# Getting Started

To get the application up and running, follow these steps:

## Prerequisites

Ensure you have the following installed:
- Elixir
- Phoenix framework
- PostgreSQL (or your preferred database)

## Installation

Clone the repository
```sh
git clone https://github.com/yourusername/MyBackend.git
cd MyBackend
```
Setup dependencies and database
```sh
mix setup
```
Start the Phoenix server
- Run the server with
  ```sh
  mix phx.server
  ```
- Or start it inside IEx for interactive development
  ```sh
  iex -S mix phx.server
  ```
Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Usage

After starting the server, navigate to `localhost:4000/users` to manage users. You can perform all CRUD operations through the web interface.

## Deployment

For deployment in a production environment, please refer to the [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn More

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source code: https://github.com/phoenixframework/phoenix
