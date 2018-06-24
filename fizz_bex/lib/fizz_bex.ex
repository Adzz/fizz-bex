defmodule FizzBex do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil, name: :fizz)
  end

  def init(_) do
    {:ok, :noop}
  end

  def handle_call({:number, number}, {pid, _}, _) do
    :timer.sleep(:rand.uniform(1000))

    string = ""

    string =
      if Integer.mod(number, 3) == 0 do
        string <> "Fizz"
      else
        string
      end

    string =
      if Integer.mod(number, 5) == 0 do
        string <> "Buzz"
      else
        string
      end

    string =
      if string == "" do
        Integer.to_string(number)
      else
        string
      end

    send(pid, {:reply, string})
    {:reply, :ok, nil}
  end
end
