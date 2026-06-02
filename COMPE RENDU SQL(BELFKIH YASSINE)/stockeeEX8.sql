create or replace procedure stockeeEX8(v_nom in varchar, v_adresse in varchar) is
begin
update employes set adresse = v_adresse where nom = v_nom;
end stockeeEX8;