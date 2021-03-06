defmodule ExOkex.Spot.Public do
  @moduledoc """
  Public Spot Client

  https://www.okex.com/docs/en/#spot-README
  """
  import ExOkex.Api.Public
  alias ExOkex.Spot

  @type instrument :: Spot.Instrument.t()
  @type error_reason :: term

  @prefix "/api/spot/v3"
  @instruments_path "#{@prefix}/instruments"

  @spec instruments :: {:ok, [instrument]} | {:error, error_reason}
  def instruments do
    @instruments_path
    |> get()
    |> parse_response()
  end

  defp parse_response({:ok, data}) do
    instruments =
      data
      |> Enum.map(&to_struct/1)
      |> Enum.map(fn {:ok, i} -> i end)

    {:ok, instruments}
  end

  defp parse_response({:error, _} = error), do: error

  defp to_struct(data), do: data |> Mapail.map_to_struct(Spot.Instrument)
end
