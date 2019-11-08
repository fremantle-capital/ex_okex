defmodule ExOkex.Swap.Private.PositionTest do
  use ExUnit.Case
  import TestHelper
  alias ExOkex.Swap

  @config %ExOkex.Config{
    api_key: "OKEX_API_KEY",
    api_secret: Base.encode64("OKEX_API_SECRET"),
    api_passphrase: "OKEX_API_PASSPHRASE"
  }

  test "returns position info" do
    response =
      http_response(
        [
          %{
            "created_at" => "2019-02-12T15:10:04.000Z",
            "instrument_id" => "BTC-USD-190329",
            "leverage" => "20",
            "liquidation_price" => "0.0",
            "long_avail_qty" => "0",
            "long_avg_cost" => "3870.5",
            "long_qty" => "0",
            "long_settlement_price" => "3870.5",
            "margin_mode" => "crossed",
            "realised_pnl" => "-0.00011875",
            "short_avail_qty" => "0",
            "short_avg_cost" => "3863",
            "short_qty" => "0",
            "short_settlement_price" => "3863",
            "updated_at" => "2019-03-10T07:19:14.000Z"
          }
        ],
        200
      )

    with_mock_request(:get, response, fn ->
      assert {:ok,
              [
                %{
                  "leverage" => "20",
                  "created_at" => "2019-02-12T15:10:04.000Z",
                  "instrument_id" => "BTC-USD-190329",
                  "liquidation_price" => "0.0",
                  "long_avail_qty" => "0",
                  "long_avg_cost" => "3870.5",
                  "long_qty" => "0",
                  "long_settlement_price" => "3870.5",
                  "margin_mode" => "crossed",
                  "realised_pnl" => "-0.00011875",
                  "short_avail_qty" => "0",
                  "short_avg_cost" => "3863",
                  "short_qty" => "0",
                  "short_settlement_price" => "3863",
                  "updated_at" => "2019-03-10T07:19:14.000Z"
                }
              ]} == Swap.Private.position("BTC-USD-190329", @config)
    end)
  end
end
