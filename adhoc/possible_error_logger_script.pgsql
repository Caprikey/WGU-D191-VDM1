do language plpgsql $$
declare
    v_state   TEXT;
    v_msg     TEXT;
    v_detail  TEXT;
    v_hint    TEXT;
    v_context TEXT;
begin

    create table yyy(a int);
    create table yyy(a int); -- this will cause an error

exception when others then 

    get stacked diagnostics
        v_state   = returned_sqlstate,
        v_msg     = message_text,
        v_detail  = pg_exception_detail,
        v_hint    = pg_exception_hint,
        v_context = pg_exception_context;

    raise notice E'Got exception:
        state  : %
        message: %
        detail : %
        hint   : %
        context: %', v_state, v_msg, v_detail, v_hint, v_context;

    raise notice E'Got exception:
        SQLSTATE: % 
        SQLERRM: %', SQLSTATE, SQLERRM;     

    raise notice '%', message_text; -- invalid. message_text is contextual to GET STACKED DIAGNOSTICS only

end; $$;


-- https://stackoverflow.com/questions/4877637/postgresql-exception-handling