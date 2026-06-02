create or replace procedure incrementer(i IN OUT number) is
begin
i:=i+1;
end incrementer;