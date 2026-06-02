create or replace function carre(n IN number) return number is
res number := 0;
begin
res := n*n;
return res;
end carre;