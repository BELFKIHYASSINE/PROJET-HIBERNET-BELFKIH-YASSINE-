create or replace function euros(mad in number) return number is
begin
return round(mad/11,2);
end euros;