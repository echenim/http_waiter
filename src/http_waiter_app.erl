%%%-------------------------------------------------------------------
%% @doc http_waiter public API
%% @end
%%%-------------------------------------------------------------------

-module(http_waiter_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->   
    Dispatch = cowboy_router:compile([
		{'_', [
			{"/", cowboy_static, {priv_file, http_waiter, "index.html"}},
			{"/upload", http_upload_handler, []}
		]}
	]),
	{ok, _} = cowboy:start_clear(http, [{port, 8083}], #{
		env => #{dispatch => Dispatch}
	}),	
    http_waiter_sup:start_link().

stop(_State) ->   
    ok = cowboy:stop_listener(http).

%% internal functions
