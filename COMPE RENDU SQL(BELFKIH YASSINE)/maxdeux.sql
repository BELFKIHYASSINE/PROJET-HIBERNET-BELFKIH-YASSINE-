create or replace procedure maxdeux(a IN number, b IN number, c OUT number) IS 
BEGIN
if (a<b) then
    c:=b;
else
    c:=a;
end if;
end maxdeux;