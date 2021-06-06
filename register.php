<?php 

include("shared/db.php");



//1 - traiter le formulaire

// var_dump($_POST);
// var_dump($_SERVER["REQUEST_METHOD"]);

    // Verification le formulaire est soumis
     if (isset($_POST["submit"])) {
         var_dump($_POST);
         // Verification de la methode utiliser pour envoyer le formulaire

        if ($_SERVER["REQUEST_METHOD"] === 'POST') {
            
            // verificaation si les champs requis existes

            if (isset($_POST["nom"], $_POST["prenom"], $_POST["email"], $_POST["mot_de_passe"], 
            $_POST["confirmation_mot_de_passe"])) {

               
                // verificqtion de la concordance des mot de passes

                if ($_POST["mot_de_passe"] === $_POST["confirmation_mot_de_passe"] ) {
                   
                    // creation du compte (instesion dans la db)

                    $nom = $_POST['nom'];
                    $prenom = $_POST['prenom'];
                    $email = $_POST['email'];
                    $telephone = $_POST['telephone'];
                    $mot_de_passe = $_POST['mot_de_passe'];

                    // valeur interne

                    $type_utilisateur = "utilisateur";
                    $date_creation = (new DateTime('NOW'))->format('Y-m-d H:i');

                    $requete = 'INSERT INTO utilisateurs(nom, prenom, email, telephone, mot_de_passe, type_u, date_creation) VALUES( '. $nom .', ' .$prenom. ', ' .$email. ', '. $telephone. ', ' .$mot_de_passe. ', ' .$type_utilisateur. ', '. $date_creation. ')';

                    $db->exec($requete);


                }else {

                    echo "Les mots de passe ne concordent pas";
                }


            }else {
                echo "Veuillez remplir tous les champs";
            }

        } else {
            echo "Vilain hacker , degage !!!";
        }

     }
    
//2 - Si c'est ok , je passe a letaoe 3 sinon j'envoi des messages d'erreur

//3 - insertion ds la bd

// message de confirmqtion ou derreur

include("views/register.view.php");
?>

