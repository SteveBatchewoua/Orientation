-- 1. Création de la table avec les contraintes appropriées
CREATE TABLE IF NOT EXISTS "DiscoveryItems" (
    "Id" SERIAL PRIMARY KEY,
    "Type" INTEGER NOT NULL, -- 0 pour Metier, 1 pour Formation
    "Title" TEXT NOT NULL,
    "Institution" TEXT NOT NULL,
    "Domain" TEXT,
    "Description" TEXT,
    "Location" TEXT,
    "Requirements" TEXT,
    "Fee" TEXT
);

-- 2. Insertion des 15 enregistrements de l'ESTM-Batouri 
INSERT INTO "DiscoveryItems" ("Type", "Title", "Institution", "Domain", "Description", "Location", "Requirements", "Fee")
VALUES 
(0, 'Ingénieur d’Exploration', 'ESTM - Batouri', 'Ingénieurie / Exploration Minière', 'Planification et supervision des activités d''exploration de ressources naturelles.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur en Exploration des ressources hydriques', 'ESTM - Batouri', 'Ingénieurie / Exploration des ressources hydriques', 'Coordination des activités d''exploration des eaux souterraines, rivières et lacs.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur en Exploration et traitement des minerais', 'ESTM - Batouri', 'Ingénieurie / Exploration et traitement des minerais', 'Supervision de l''exploration et du traitement des minerais.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur Topographe', 'ESTM - Batouri', 'Ingénieurie / Topographie', 'Mesure et représentation de la forme de la surface terrestre.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur Minérallurgiste', 'ESTM - Batouri', 'Ingénieurie / Métallurgie', 'Transformation des minerais en produits métallurgiques.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur Métallurgiste', 'ESTM - Batouri', 'Ingénieurie / Métallurgie et Sidérurgie', 'Transformation des minerais en métaux et alliages.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur Opérateur de Production', 'ESTM - Batouri', 'Ingénieurie / Procédé de Production', 'Supervision des activités de production industrielle.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur en Eco-Matériaux', 'ESTM - Batouri', 'Ingénieurie / Eco-Matériaux', 'Conception de matériaux respectueux de l''environnement.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur Environnementaliste', 'ESTM - Batouri', 'Ingénieurie / Environnement', 'Mise en œuvre de solutions pour protéger l''environnement.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur en Sciences des Pierres et Métaux Précieux', 'ESTM - Batouri', 'Ingénieurie / Sciences des Pierres et Métaux Précieux', 'Extraction et valorisation des pierres et métaux précieux.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur en Economie et Administration Minière et Energétique', 'ESTM - Batouri', 'Ingénieurie / Economie et Admin.', 'Gestion optimisée des activités minières et énergétiques.', 'Batouri', 'Bacc A, C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur en Développement Commercial', 'ESTM - Batouri', 'Ingénieurie / Développement Commercial', 'Stratégies pour augmenter les ventes et la présence sur le marché.', 'Batouri', 'Bacc A, C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur Exploitation d’Hydrocarbures', 'ESTM - Batouri', 'Ingénieurie / Energie Fossiles', 'Supervision de l''exploitation du pétrole et du gaz naturel.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur en Production Energie', 'ESTM - Batouri', 'Ingénieurie / Production Energétique', 'Coordination de la production d''énergie électrique et renouvelable.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA'),
(0, 'Ingénieur en Maîtrise Energétique', 'ESTM - Batouri', 'Ingénieurie / Maîtrise Energétique', 'Optimisation de la consommation d''énergie dans les bâtiments et industries.', 'Batouri', 'Bacc C, D, E, TI, F, BT, GCE A/L', '50 000 FCFA');

-- 3. Création des index pour la performance de recherche
CREATE INDEX IF NOT EXISTS "idx_title" ON "DiscoveryItems" ("Title");
CREATE INDEX IF NOT EXISTS "idx_institution" ON "DiscoveryItems" ("Institution");