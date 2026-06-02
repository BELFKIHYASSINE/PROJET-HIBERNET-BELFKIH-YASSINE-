create or replace function maxdeuxFonction(a IN number, b IN number) return number IS 
c number;
BEGIN
if (a<b) then
c:=b;
else
c:=a;
end if;
return c;
end maxdeuxFonction;