<?php
// Inclure le fichier de connexion à la base de données
include('../database/connexionDB.php');

// Requête SQL pour sélectionner toutes les marques avec le nombre de modèles associés
$query = "
    SELECT 
        marque.IdMarque, 
        marque.NomMarque, 
        COUNT(modele.IdModele) AS NombreModeles
    FROM marque
    LEFT JOIN modele ON marque.IdMarque = modele.IdMarque
    GROUP BY marque.IdMarque, marque.NomMarque
";

// Exécuter la requête
$curseur = mysqli_query($DB, $query);

// Vérifiez si la requête a réussi
if (!$curseur) {
    http_response_code(500); // Erreur interne du serveur
    echo json_encode(['error' => 'Erreur lors de la récupération des données']);
    exit;
}

// Récupérez les données sous forme de tableau associatif
$donnees = mysqli_fetch_all($curseur, MYSQLI_ASSOC);

// Fermez la connexion à la base de données
mysqli_close($DB);

// Définissez l'en-tête HTTP pour JSON
header('Content-Type: application/json');

// Convertissez les données en JSON et les renvoyer
echo json_encode($donnees);
?>

