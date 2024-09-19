defmodule ElixirCards do
  @moduledoc """
  Documentation for `ElixirCards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirCards.hello()
      :world

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Hearts", "Diamonds", "Clubs", "Spades"]

    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} of #{suit}"
    #   end
    # end

    # List.flatten(cards)
    for value <- values, suit <- suits do
      "#{value} of #{suit}"
    end
  end

  @spec shuffle(list()) :: list()
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @spec contains?(list(), any()) :: boolean()
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @spec deal(any(), integer()) :: {list(), list()}
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # {status, binary} = File.read(filename)

    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "That file does not exist"
    # end

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reasoon} -> "That file does not exist"
    end
  end
end
