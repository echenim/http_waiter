%%%-------------------------------------------------------------------
%% @doc http_waiter public API
%% @end
%%%-------------------------------------------------------------------

-module(http_waiter_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    http_waiter_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
