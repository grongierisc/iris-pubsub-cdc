select id, obj,verbe FROM bal;

select * from formation;

INSERT INTO public.formation
(id, nom, salle)
VALUES(3, 'formation3', 'salle3');

UPDATE public.formation SET nom = 'formation33' where id = 3;