CREATE SCHEMA demodata;

CREATE TABLE public.formation (
	id int8 NULL,
	nom varchar NULL,
	salle varchar NULL
);

INSERT INTO public.formation
(id, nom, salle)
VALUES(1, 'formation1', 'salle1');

INSERT INTO public.formation
(id, nom, salle)
VALUES(2, 'formation2', 'salle2');

CREATE TABLE public.bal (
	id int8 NULL,
	obj varchar NULL,
	verbe varchar NULL,
	datec timestamp NOT NULL
);


CREATE OR REPLACE FUNCTION formation_bal() RETURNS TRIGGER AS $formation_bal$
BEGIN
    --
    -- Ajoute une ligne dans bal pour refléter l'opération réalisée
    -- sur formation,
    -- utilise la variable spéciale TG_OP pour cette opération.
    --
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO public.bal SELECT OLD.id,'formation','DELETE', now();
    ELSIF (TG_OP = 'UPDATE') THEN
        INSERT INTO public.bal SELECT NEW.id,'formation','UPADTE', now(); 
    ELSIF (TG_OP = 'INSERT') THEN
        INSERT INTO public.bal SELECT NEW.id,'formation','INSERT' now();
    END IF;
    RETURN NULL; -- le résultat est ignoré car il s'agit d'un trigger AFTER
END;
$formation_bal$ language plpgsql;

CREATE TRIGGER formation_bal
    AFTER INSERT OR UPDATE OR DELETE ON public.formation
    FOR EACH ROW EXECUTE FUNCTION formation_bal();