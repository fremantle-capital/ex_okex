defmodule ExOkex.Spot.Private.CreateBulkOrders do
  import ExOkex.Api.Private

  @prefix "/api/spot/v3"

  def create_bulk_orders(params, config \\ nil) do
    "#{@prefix}/batch_orders"
    |> post(params, config)
  end
end
