create or replace procedure augmenter_salaire(v_enum in varchar, taux in number) is
sal employes.salaire%type;
begin
select salaire into sal from employes where Enumber = v_enum;
sal := sal*(1+taux/100);
update employes set salaire = sal where Enumber = v_enum;
end augmenter_salaire;