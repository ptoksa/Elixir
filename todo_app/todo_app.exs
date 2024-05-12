defmodule TodoApp do
  def start do
    loop([])
  end

  defp loop(todos) do
    IO.puts("\n=== Todo List ===")
    list_todos(todos)
    IO.puts("\nWhat would you like to do?")
    IO.puts("1. Add todo")
    IO.puts("2. Remove todo")
    IO.puts("3. Exit")
    case IO.gets(">> ") |> String.trim() do
      "1" -> loop(add_todo(todos))
      "2" -> loop(remove_todo(todos))
      "3" -> IO.puts("Goodbye!")
      _ -> 
        IO.puts("Invalid choice. Please choose again.")
        loop(todos)
    end
  end

  defp list_todos([]), do: IO.puts("No todos.")
  defp list_todos(todos) do
    Enum.with_index(todos) |> Enum.each(fn {todo, index} ->
      IO.puts("#{index + 1}. #{todo}")
    end)
  end

  defp add_todo(todos) do
    IO.puts("\nEnter the todo:")
    todo = IO.gets(">> ") |> String.trim()
    [todo | todos]
  end

  defp remove_todo([]), do: IO.puts("No todos to remove.")
  defp remove_todo(todos) do
    IO.puts("\nEnter the index of the todo to remove:")
    index = IO.gets(">> ") |> String.trim() |> String.to_integer()
    if index < 1 or index > length(todos) do
      IO.puts("Invalid index. Please try again.")
      remove_todo(todos)
    else
      updated_todos = List.delete_at(todos, index - 1)
      IO.puts("Todo removed.")
      updated_todos
    end
  end
end

TodoApp.start()
