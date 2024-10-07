defmodule JokesWeb.ApiController do
  use JokesWeb, :controller
  alias Jokes.Joke
  alias Jokes.Repo

  # List all jokes
  def list_jokes(conn, _params) do
    jokes = Repo.all(Joke)
    json(conn, jokes)
  end

  # Get a single joke by ID
  def get_joke!(conn, %{"id" => id}) do
    joke = Repo.get!(Joke, id)
    json(conn, joke)
  end

  # Create a new joke
  def create_joke(conn, %{"joke" => joke_params}) do
    changeset = Joke.changeset(%Joke{}, joke_params)

    case Repo.insert(changeset) do
      {:ok, joke} ->
        conn
        |> put_status(:created)
        |> json(joke)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(changeset)
    end
  end

  # Update an existing joke
  def update_joke(conn, %{"id" => id, "joke" => joke_params}) do
    joke = Repo.get!(Joke, id)
    changeset = Joke.changeset(joke, joke_params)

    case Repo.update(changeset) do
      {:ok, joke} ->
        json(conn, joke)

      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(changeset)
    end
  end

  # Delete a joke
  def delete_joke(conn, %{"id" => id}) do
    joke = Repo.get!(Joke, id)

    case Repo.delete(joke) do
      {:ok, _} ->
        send_resp(conn, :no_content, "")

      {:error, _} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: "Unable to delete the joke."})
    end
  end

  # Change joke changeset
  def change_joke(joke) do
    Joke.changeset(joke, %{})
  end
end
