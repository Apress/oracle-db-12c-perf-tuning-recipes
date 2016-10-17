create or replace trigger trace_my_user
  after logon on database
  begin
   if user='SH' then
   dbms_monitor.session_trace_enable(null,null,true,true);
   end if;
  end;
/
