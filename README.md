# ExOkex

OKEX API client for Elixir.

## Installation

List the Hex package in your application dependencies.

```elixir
def deps do
  [{:ex_okex, "~> 0.1"}]
end
```

Run `mix deps.get` to install.

## Configuration

Add the following configuration variables in your config/config.exs file:

```elixir
use Mix.Config

config :ex_okex, api_key:        {:system, "OKEX_API_KEY"},
                 api_secret:     {:system, "OKEX_API_SECRET"},
                 api_passphrase: {:system, "OKEX_API_PASSPHRASE"}
```

Alternatively to hard coding credentials, the recommended approach is
to use environment variables as follows:

```elixir
use Mix.Config

config :ex_okex, api_key:        System.get_env("OKEX_API_KEY"),
                 api_secret:     System.get_env("OKEX_API_SECRET"),
                 api_passphrase: System.get_env("OKEX_API_PASSPHRASE")
```

Alternatively, if you need to work with multiple OKEX accounts, the private API
call functions accept an additional `config` (`ExOkex.Config` struct) parameter:

```elixir
config = %ExOkex.Config{
  api_key: "API_KEY",
  api_secret: "API_SECRET",
  api_passphrase: "API_PASSPHRASE",
  api_url: "API_URL" # optional
}
ExOkex.list_accounts() # use config as specified in config.exs
ExOkex.list_accounts(config) # use the passed config struct param
```

## Usage

Place a limit order

```elixir
iex> ExOkex.create_order(%{
  "client_oid" => "20180728",
  "instrument_id" => "btc-usdt",
  "side" => "sell",
  "type" => "limit",
  "size" => "0.1",
  "price" => "1",
  "margin_trading" => 1
})
{:ok,
 %{"order_id" => "234652",
   "client_oid" => "23",
   "result" => true}
```

## Additional Links

[Full Documentation](https://hexdocs.pm/ex_okex/ExOkex.html)

[OKEX API Docs](https://www.okex.com/docs/)

## License

MIT

## Acknowledgement

Many parts of this client were taken from [ExGdax](https://github.com/bnhansn/ex_gdax) and adapted for OKEx API.