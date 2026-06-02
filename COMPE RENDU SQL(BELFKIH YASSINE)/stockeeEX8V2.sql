create or replace procedure stockeeEX8V2(v_enumber in number, v_adresse in varchar) is
begin
update employes set adresse = v_adresse where enumber = v_enumber;
end stockeeEX8V2;