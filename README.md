# The Goosbook VERSION 2 #
<hr/>

> Ce travail est optionnel, réalisé pendant le weekend de la semaine 5 de The Hacking Project. Il consiste a reprendre 'from scratch' le projet de jeudi qui consistait à réaliser une application type réseau social ou l'utilisateur peux se connecter à un profil perso, écrire des potins, commenter et liker les potins des autres. Il lui est aussi possible de modifier ses potins, de les supprimer, d'ajouter des tags.    

<hr/>
  
* Voir le site en production/  
  
--> <a href="https://gossbook.herokuapp.com/" target="_blank">ici</a>.  
  
## Liste des fonctionnalités/  
* Un user peux:  
--> creer, modifier, supprimer des gossips  
--> liker, retirer son like qu'une seule fois par gossip et commentaire  
--> consulter l'index de tout les gossips  
--> consulter l'index de tout les users  
--> creer des 'tags' pour ses gossips  
  
### Architecture des Bases de données:  
  
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
  
  
## Liste exhaustive des erreurs rencontrées et leurs solutions/  
  
* [?] :alien: Aprés avoir créer mon nouveau projet rails en postgresql, généré des models, saisie des relation, paramettré mes fichiers de migration pour mettre les champs que je voulais dans mes tables etc.. j'ai voulue db:migrate mon programme et j'ai rencontré ce type d'erreur :  
``` up 2017100913.. *********NO FILE*********
  up 2017100913.. *********NO FILE*********
  up 2017100913.. *********NO FILE*********  
```  
  
* [!] :key: Aprés avoir détruit et recommencé tout mon travail plusieurs fois, j'ai fini par comprendre que l'erreur provenait de la nécéssité de faire un ``` db:create ``` **avant de migrer**. Une fois les "no_file" envoyé impossible d'effectuer d'autre migration par dessus. J'ai tenté de drop a partir des id de migration directement via la console psql, de supprimer le fichier sql, enfin bref, une vraie pagaille. J'ai due tout recommencer depuis le départ et en plus avec un nouveau nom pour l'app, car un message d'erreur 'already exist' m'empechait par la suite de **db:create**.

------------------------------------------------------------------------------------  
* [?] :alien: Aprés avoir crée mon model user basiquement (just :name, :email) et avoir crée une instance 'bob', je crée un test dans ```/test/models/user_test.rb``` comme suis :  
``` require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end
end 
```  
  Et en lancant le test dans le terminal avec ```rails test:models``` au lieux d'obtenir la barre de chargement du test comme dans l'exemple en vidéo, j'obtiens :  
``` Run options: --seed 41486

# Running:

.

Finished in 0.086882s, 11.5099 runs/s, 11.5099 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```  
* [!] :key: Le test avait en réalité bien fonctionné, sauf que l'affichage différait certainement car l'os utilisé dans l'exemple était différent. Il m'a suffit d'inserer une condition et quelques puts pour avoir un rendu plus explicite :  
```test "should be valid" do
    if assert @user.valid?
      puts "USER VALID :) "
    else 
      puts "USER INVALID :( "
    end
  end
  ```  
  Pour obtenir :  
```Run options: --seed 43067

# Running:

USER VALID !!
.

Finished in 0.086668s, 11.5383 runs/s, 11.5383 assertions/s.
1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```  
------------------------------------------------------------------------------------  
* [?] :alien: Je viens de tester la validité de mes 'name' avec :  
``` test "name should be present" do
    @user.name = "     "
    assert_not @user.valid? 
    puts "champ 'name' cant be empty: CHECK!"
  end
```  
  Ce qui fonctionne trés bien. Il se trouve que j'ai aussi besoin de tester la même chose sur mon champ 'email'. Je copie colle ce code et remplace **.name** par **.email** un peu partout.  
```test "name should be present" do
    @user.email = "     "
    assert_not @user.valid? 
    puts "champ 'email' cant be empty: CHECK!"
  end
```  
  Et j'obtiens ```rails aborted!
test_name_should_be_present is already defined in UserTest```  

* [!] :key: Chaque test doit avoir un nom différent (RAPEL rails 'DON'T REPEAT YOURSELF'), donc la premiere ligne ```test "name should be present" do``` devient  ```test "email should be present" do``` et magie :  
```Run options: --seed 16094

# Running:

champ 'email' cant be empty: CHECK!
.champ 'name' cant be empty: CHECK!
.champ 'email' non-nil: CHECK!
.

Finished in 0.096805s, 30.9901 runs/s, 30.9901 assertions/s.
3 runs, 3 assertions, 0 failures, 0 errors, 0 skips
```  
------------------------------------------------------------------------------------  
