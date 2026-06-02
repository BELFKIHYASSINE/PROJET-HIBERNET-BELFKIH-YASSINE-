CONTRAINT 13

CREATE OR REPLACE TRIGGER trigger13
BEFORE DELETE ON module
FOR EACH ROW
DECLARE
n number;
BEGIN
SELECT COUNT(*) INTO n FROM prerequis WHERE prerequis = :OLD.code_module;
IF n>0 THEN
    RAISE_APPLICATION_ERROR(-20013,'module is already referenced');
end if;
end;

CONTRAINT 12

CREATE OR REPLACE TRIGGER trigger12
BEFORE UPDATE OF moyenne ON etudiant
FOR EACH ROW
DECLARE
n number;
exam examen.id_examen%type;
BEGIN
SELECT COUNT(*) INTO exam FROM examen WHERE code_module IN (SELECT code_module FROM inscription WHERE id_etudiant = :NEW.id_etudiant);
SELECT COUNT(*) INTO n FROM passer WHERE id_etudiant = :NEW.id_etudiant AND id_examen IN (SELECT id_examen FROM examen WHERE module IN (SELECT code_module FROM inscription WHERE id_etudiant = :NEW.id_etudiant));
if (n<exam) then
    RAISE_APPLICATION_ERROR(-20012,'etudiant n''a pas passer tous les examens');
end if;
end;

CONTRAINT 11

CREATE OR REPLACE TRIGGER trigger11
BEFORE INSERT ON examen
FOR EACH ROW
DECLARE
n number;
BEGIN
SELECT COUNT(*) INTO n FROM examen WHERE code_module = :NEW.code_module AND ABS(date_examen - :NEW.date_examen) <= 7;
if(n!=0) then
    RAISE_APPLICATION_ERROR(-20011, 'impossible d''inserer d''examen avant 7 jours');
end if;
end;

CONTRAINT 10

CREATE OR REPLACE TRIGGER trigger10
BEFORE INSERT ON inscription
FOR EACH ROW
DECLARE
dummy number;
BEGIN
SELECT 1 INTO dummy FROM inscription WHERE id_etudiant = :NEW.id_etudiant AND code_module = :NEW.code_module;
SELECT 1 INTO dummy FROM etudiant WHERE id_etudiant = :NEW.id_etudiant AND  moyenne > (SELECT note_min FROM module WHERE code_module = :NEW.code_module);
RAISE_APPLICATION_ERROR(-20010,'l''étudiant a déja valider ce module');
EXCEPTION
WHEN NO_DATA_FOUND THEN
NULL;
END;

