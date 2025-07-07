
# But de la SQ:


- Maldev en utilisant les capacités de Nim afin d'évader la détection
- Analyse et Reverse des binaires afin d'identifier leur language de développement
- Automatisation de règles yara pour cibler les binaires écrits en Nim



# Concepts:


## Pourquoi Nim?


- FFI mature
- Double compilation native vers le C, C++, JS et ObjC
- Ne rely pas sur un runtime / vm pour créer ses binaires (cf: go / python) donc binaire assez petits
- Couche d'abstraction et permet d'éviter les problèmes de sécurité souvent présents en C / C++
- Cross-compilation simple


## Développement

Plusieurs modules offensifs vont être développés et regroupés dans un seul binaire:
- Injecteur de process
- Canal de communication c2
- Infostealer
- ....

Le but n'est pas de maximiser un potentiel d'évasion par un développement "malin" mais plutôt en utilisant les outils mis à disposition par le Nim


## Environnement de test

Dans le repository Github, est fourni un docker compose permettant de lancer un windows avec le directory des binaires déjà monté. Cela permet de tester ses binaires facilement dans un environnement snapshotable et facile à up et kill.


## Purple

L'intérêt de la phase de reverse va être d'identifier des marqueurs spécifiques aux binaires Nim permettant une détection systématique indépendamment des fonctionnalités.

Pour cela IDA et Miasm vont être utilisés afin de déterminer ces points. Le détail ne sera pas présenté ici, car ce travail n'a pas vocation à être automatisé et manque de maturité

Un ensemble de règles fonctionnelles regroupant tous les strings et bytes importants des binaires vont être présents sur le Github afin de pouvoir constater les différences sans avoir touché au binaire.


# Introduction au Nim


Détaillons quelques points clés du NIm afin de faciliter la compréhension du projet:

## Compilation

Voici une vue de comment la compilation va marcher chez Nim:

![[./Excalidraw/Cmp.excalidraw]]

Prenons pour exemple la compilation vers le C:
- Le fichier Nim va être "transformé" en fichier source .c grâce à la FFI Nim
- Le .c va être compilé par le compilateur choisi (gcc, clang, llvm, mingw, etc...)

Le compilateur Nim va dans les grandes lignes:
- Parser le code .nim
- Effectuer une analyse sémantique afin de préparer les structures de données 
- Générer du code C correspondant en prenant en compte les paramètres de compilation (-d:useMalloc / --nomain / etc...)


Cela présente un premier avantage: la génération normée d'un code

Une fois ce fichier c crée, il va pouvoir être compilé, et nous pouvons aussi lui passer des paramètres concernant de l'optimisation, suppression de données "inutiles", formation des sections, etc...

Tout cela va nous assure une optimisation dans l'anti-détection sans avoir à l'intégrer dans le code source.


## FFI

La FFI est un mécanisme qui permet à un langage de programmation d’interagir avec du code écrit dans un autre langage afin d'appeler des fonctions écrites dans un autre langage, utiliser des structures définies dans un autre langage , ou encore être appelé _depuis_ du code d'un un autre langage.

Ce point est donc nécessaire pour la compilation et nous garantit:
- Utilisation des bibliothèques bas-niveau / natives sans avoir à les réécrire (windows.h / apis matérielles / drivers)
- Aucun cout d'abstraction engendré lors de la compilation
- Création de bindings automatiques 


## Architecture de développement

Le code présenté va principalement utiliser des bibliothèques propres à Nim (winim) afin d'éviter la sur-utilisation des FFIs (sauf pour l'exemple MessageBox) 

Cela présente un désavantage car on va importer le contenu complet de l'interface (Toute l'api COM / une dll entière) ce qui permet une surface de détection plus grande. On a choisi de considérer ce point comme négligeable



# Current state of dev


- Process Injection has been finalized
- C2 exfiltration via discord has been finalized
- Infostealer & Ransomware capabilities are still in developpement and wil not be pushed as the core of the projet does not rely on it










