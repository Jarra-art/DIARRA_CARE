USE Diarra_care2;


SELECT t.nom_medicament, t.posologie, t.duree_jours
FROM Traitement t
JOIN Diagnostic d ON t.id_diagnostic = d.id_diagnostic
WHERE d.description LIKE '%diabète%';







