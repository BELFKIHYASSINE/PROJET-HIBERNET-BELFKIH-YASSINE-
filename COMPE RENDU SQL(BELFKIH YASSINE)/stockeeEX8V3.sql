create or replace procedure stockeeEX8V3(v_enumber in number, v_adresse in varchar) is
begin
if (adresse is not null) then
update employes set adresse = v_adresse where enumber = v_enumber;
end if;
end stockeeEX8V3;