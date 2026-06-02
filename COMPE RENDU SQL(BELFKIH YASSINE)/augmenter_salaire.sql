create or replace procedure augmenter_salaire(v_nom in varchar, taux in number) is
sal employes.salaire%type;
begin
select salaire into sal from employes where nom = v_nom;
sal := sal*(1+taux/100);
update employes set salaire = sal where nom = v_nom;
end augmenter_salaire;