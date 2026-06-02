create or replace function euros(mad in number, taux in number) return number is
begin
return round(mad*(taux/100));
end euros;