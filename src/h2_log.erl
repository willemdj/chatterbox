-module(h2_log).

-compile({no_auto_import,[error/2]}).

-export([debug/1, debug/2,
         info/1, info/2,
         warning/1, warning/2,
         error/1, error/2]).

debug(Message) ->
    debug(Message, []).

debug(_Message, _Vars) ->
    ok.

info(Message) ->
    info(Message, []).

info(Message, Vars) ->
    error_logger:info_report(chatterbox, format(Message, Vars)).

warning(Message) ->
    warning(Message, []).

warning(Message, Vars) ->
    error_logger:warning_report(chatterbox, format(Message, Vars)).

error(Message) ->
    error(Message, []).

error(Message, Vars) ->
    error_logger:error_report(chatterbox, format(Message, Vars)).


%%% ---------------------------------------------------------------------------
%%% internal functions
%%% ---------------------------------------------------------------------------
format(Message, Vars) ->
    try lists:flatten(io_lib:format(Message, Vars)) 
    catch 
        _:_ ->
            "Error in error message"
    end.
