create or replace procedure permutation(a IN OUT number, b IN OUT number) is
c number;
begin
c:=a;
a:=b;
b:=c;
end permutation;