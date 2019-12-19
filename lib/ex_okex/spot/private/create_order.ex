defmodule ExOkex.Spot.Private.CreateOrder do
  import ExOkex.Api.Private

  @prefix "/api/spot/v3"

  def create_order(params, config \\ nil) do
    "#{@prefix}/orders"
    |> post(params, config)
  end
end
