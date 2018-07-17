# Starter Project

Ceci est un projet contenant toutes les librairies et la configuration minimale pour chaque nouveau projet.

## Pour chaque nouveau projet :

- Cloner ce repo `git clone https://github.com/AnthoPakPak/iOSStartProject.git`
- Commenter/Décommenter dans le `Podfile` les librairies nécessaires
- Lancer `./RenameProject.sh StartProject NewProjectName` pour changer le nom du projet (`ack` et `rename` doivent être installés)
- `pod install` si ce n'est pas déjà fait
- Supprimer le dossier `.git` puis `Create Git Repositories` dans Xcode
- Changer le bundle identifier
- Enlever les trucs inutiles dans `AppDelegate.m`
- `Pomme + B` pour vérifier qu'il n'y a pas d'erreurs

<!-- - Changer la target dans le `Podfile` -->
<!-- - Changer le nom du `.pch` + Dans Build Settings, mettre `Prefix Header` à la bonne valeur (`$(SRCROOT)/$(PROJECT_NAME)/PROJECTNAME-Prefix.pch`) -->

## Librairies :

### Inclues dans le Podfile : 

- [AFNetworking](https://github.com/AFNetworking/AFNetworking)
- [ChameleonFramework](https://github.com/viccalexander/Chameleon)
- [FLEX](https://github.com/Flipboard/FLEX)
- [GHConsole](https://github.com/Liaoworking/GHConsole)
- [MLeaksFinder](https://github.com/Tencent/MLeaksFinder)
- [FBRetainCycleDetector](https://github.com/facebook/FBRetainCycleDetector)
- [IQKeyboardManager](https://github.com/hackiftekhar/IQKeyboardManager) (à décommenter si nécessaire)
- [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD) (à décommenter si nécessaire)
- [KLCPopup](https://github.com/jmascia/KLCPopup) (à décommenter si nécessaire)


### Non inclues dans le Podfile (et donc à ajouter si nécessaire) :

- [MagicalRecord](https://github.com/magicalpanda/MagicalRecord) : Utilisation de CoreData facilitée 
- [Form](https://github.com/hyperoslo/Form) ([Version customisée](https://github.com/AnthoPakPak/FormCustom)) : Créer des formulaires avancés depuis un fichier JSON (avec validations et actions)
- [IQDropDownTextField](https://github.com/hackiftekhar/IQDropDownTextField) : TextField qui affiche un PickerView quand on clique dessus
- [PopupDialog](https://github.com/Orderella/PopupDialog) : Jolis Popup de confirmation, choix, etc, faciles d'utilisation (`pod 'PopupDialog', '0.7.1'` pour la version Objective C)
- [AMPopTip](https://github.com/andreamazz/AMPopTip) : Bulles d'information (tooltip) qui s'affichent au dessus d'un élément pour donner une explication par exemple (`pod 'AMPopTip', '~> 1.5'` pour la version Objective C)
- [SexyTooltip](https://github.com/calm/SexyTooltip) : Un autre style de Tooltip
- [LUNSegmentedControl](https://github.com/Stormotion-Mobile/LUNSegmentedControl) : Jolis UISegmentedControl
- [ZMJGanttChart](https://github.com/keshiim/ZMJGanttChart) : Affichage de tableaux "à la Excel"
- [M13PDFKit](https://github.com/Marxon13/M13PDFKit) : Un viewer PDF (ajouter également `pod 'TTOpenInAppActivity' , '1.0'` au Podfile car sinon c'est bugué)
- [ActionSheetPicker](https://github.com/skywinder/ActionSheetPicker-3.0) : Affichage d'un picker view pratique avec handler pour la réponse
- [PopOverMenu](https://github.com/tichise/PopOverMenu) : Affichage d'un popover avec un table view et un completion handler
