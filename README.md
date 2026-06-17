# Projet PORTFOLIO professionnel AURELIA LECLERC QA

## 📌 Description
Ceci est un projet de démonstration d’un framework d’automatisation des tests qui comprend:
- Des applications de test originaux
- Des scénarios métier réalistes
- Une structure propre et maintenable: idéale pour la mise en place d'un socle d'automatisation
- Une stratégie d'automatisation
- Des reflexions sur la place de l'IA

### 🛠️ Stack technique
- RobotFramework
- Copilot
- GIT


### 🚀 Les objectifs
- Démontrer une expertise en automatisation
- Simuler un contexte projet réel

### 🌐 Portfolio
Lien vers le portfolio qui heberge les applications et leurs tests : [AureliaLeclercQA](https://aurelialeclercqa.github.io/)

## Tests automatisés
### Architecture du projet
Le projet d'automatisation se structure de la façon suivante - <span style="color:blue"> Dossier </span> / <span style='color:rgb(207, 19, 110)'> Fichier </span> :


- <span style="color:blue">TESTFACTORY </span>  : dossier contenant tout le projet d'automatisation
    - Sous dossier <span style="color:blue">Resources </span>:
        - <span style="color:blue"> APPS </span>: chaque fichier ici représente une application. Dans un projet de test de site, cela pourrait par exemple représenter une page ou une fonctionnalité. On prefererai alors le nom "PO" (Page Object) pour ce dossier. On trouve notamment des variables relatives à la page ou l'application, et des keywords spécifiques.
        - <span style="color:blue"> PYTHON </span>: contient d'éventuelles fonctions developpées en python.
        - <span style="color:blue"> SOCLE </span>: contiens des keywords communs.
        - <span style='color:rgb(207, 19, 110)'> Common.robot </span> 
        - Eventuellement <span style='color:rgb(207, 19, 110)'> fichier datas.xlsx </span>: peut être lu si besoin, pour être utilisé pour des tests. Exemple: des identifiants non confidentiels, des adresses mail de test. Eviter les mots de passe (--> voir solution pour les mdp). Remarque: dans le cadre d'un test on peut aussi être amené à interroger une base de donnée --> Necessite requête SQL?
    - Sous dossier <span style="color:blue">Results </span>:
        - Screenshot
    - Sous dossier <span style="color:blue">Tests </span> :
    - .venv: environnement virtuel, permet d'avoir un python ici par exemple qui ne s'installe que pour les tests effectués dans l'environnement, on peut alors avoir une version specifique aux tests.
    - .vscode: contiens settings.json qui liste des fonctionnalités a integrer par exemple au run des tests robotframework. Exemple: ajout d'un dossier de destination aux résultats des tests.

    Activer venv: .\.venv\Scripts\Activate.ps1

### ▶️ Lancement des tests
Installer l'extension VSCODE: RobotCode - The Ultimate Robot Framework Toolset. Ne pas hesiter à redémarrer VSCODE pour prendre en compte tout les changements.
