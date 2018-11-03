## The Goosbook VERSION 2 ##
<hr/>

> Ce travail est optionnel, réalisé pendant le weekend de la semaine 5 de The Hacking Project. Il consiste a reprendre 'from scratch' le projet de jeudi qui consistait à réaliser une application type réseau social ou l'utilisateur peux se connecter à un profil perso, écrire des potins, commenter et liker les potins des autres. Il lui est aussi possible de modifier ses potins, de les supprimer, d'ajouter des tags.    

<hr/>
  
## Liste des fonctionnalités/  
* Un user peux:  
--> creer, modifier, supprimer des gossips  
--> liker, retirer son like qu'une seule fois par gossip et commentaire  
--> consulter l'index de tout les gossips  
--> consulter l'index de tout les users  
--> creer des 'tags' pour ses gossips  
  
## Architecture des Bases de données:  
  
* 5 tableaux répartis comme suis/  
  
L tab **users** :   
----L champs :  
--------L :id (integer primary key autoincrement)  
--------L :name (string)  
--------L :email (string)  
--------L :password (string)   
  
L tab **gossips**:  
----L champs :  
--------L :id (integer primary key autoincrement)   
--------L :title (string)  
--------L :content (text)  
--------L :user_id (integer)  
--------L :tag (string)  
  
L tab **tags**:  
----L champs :  
--------L :id (integer primary key autoincrement)  
--------L :content (integer)  
--------L :counter_cache (integer)  
  
L tab **likes**:  
----L champs :  
--------L :id (integer primary key autoincrement)   
--------L :user_id (integer)  
--------L :likeable_type (string)  
--------L :likeable_id (integer)  
  
L tab **comments**:  
----L champs :  
--------L :id (integer primary key autoincrement)   
--------L :user_id (integer)  
--------L :commentable_type (string)  
--------L :commentable_id (integer)  
--------L :content (text)   
  
<hr/>
  
> Pour tester la relation N-N dans ce programme nous allons créer un assemblage de biberon pour bébé. (NB: ne pas oublier 'bundle install' et 'rails db:migrate' avant de commencer)  

<hr/>  
  
* Voir le site en production/
  
  --> <a href="https://gossbook.herokuapp.com/" target="_blank">ici</a>.


