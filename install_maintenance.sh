#!/bin/bash
printf "\e[8;25;40t"
OS=$(lsb_release -i | cut -d ":" -f 2)
echo -e "$(tput setaf 0)$(tput setab 9)              Vous utilisez             \n$(tput sgr0)
            $(tput setaf 0)$(tput setab 3)$OS$(tput sgr0)"
echo ""
read -p ' Cela est-il correct ? oui/non ⇾ ' yn
case $yn in
        [Yy]* ) echo "$(tput setaf 0)$(tput setab 3)   Vous confirmez utiliser $OS !   "; break;;
        [Nn]* ) echo ""; 
        echo "$(tput setaf 0)$(tput setab 3)   Vous devriez utiliser Linux mint !   ";
        echo ""; 
        sleep 5; echo "$(tput setaf 7)$(tput setab 0)                AU REVOIR               "; sleep 5;exit;;
        * ) echo "" 
        echo "$(tput setaf 0)$(tput setab 9)            Continuons donc...          ";;
    esac
sleep 2
case $OS in
  'Linux')
    OS='Linuxmint'
    ;;
  'Arch')
    OS='Arch'
    ;;
  'Debian')
    OS='Debian'
    ;;
  'MacOS') 
    OS='MacOS'
    ;;
  'SunOS')
    OS='Solaris'
    ;;
  'Kali')
    OS='Kali'
    ;;
  'AIX') ;;
  *) ;;
esac
    echo "$(tput setaf 0)$(tput setab 9)     Nous chargeons l'utilitaire de     $(tput sgr0)"
    echo "         $(tput setaf 0)$(tput setab 3)$OS$(tput sgr0)"
    sleep 3
    echo "$(tput setaf 0)$(tput setab 2)            APT opérationnel            $(tput sgr0)"
    sleep 1
    echo "$(tput setaf 0)$(tput setab 1) Nous vérifions l'emplacement du script $(tput sgr0)"
    sleep 2

    checkfile=/home/$USER/Maintenance
checkdir() {
	if [ -e $checkfile ]; then
		echo "$(tput setaf 0)$(tput setab 2)       Le script est bien présent.      $(tput sgr0)"
		echo ""
    echo "                 👍👍👍"
    echo ""
		sleep 1.5
		echo "$(tput setaf 0)$(tput setab 9)   Celui-ci se trouve au bon endroit    $(tput sgr0)"
		sleep 1.5 
		echo ""
		echo "$(tput setaf 0)$(tput setab 7)    Vous le trouverez à cet endroit     $(tput sgr0)"
		sleep 1.5 
		echo ""
		echo "          $checkfile        "
		echo ""
    sleep 1.5
		echo "$(tput setaf 0)$(tput setab 9) Nous allons lancer le script pour vous $(tput sgr0)"
		sleep 1.5
    echo "$(tput setaf 0)$(tput setab 9) Obtention des droits sur les fichiers  $(tput sgr0)"
		sleep 1.5
		echo ""  
    cd /home/$USER/ && sudo chmod +x -R Maintenance
		echo "$(tput setaf 0)$(tput setab 9)  Veuillez entrer votre mot de passe :  $(tput sgr0)"
    echo "" 
    /home/$USER/Maintenance/logiciel.sh
    sleep 1.5
	else
		echo -e "$(tput setaf 0)$(tput setab 9)    Le répertoire n'a pas été trouvé    $(tput sgr0)"
		sleep 3
		echo ""
    echo "$(tput setaf 0)$(tput setab 9)   Nous allons télécharger le script    $(tput sgr0)"
		sleep 0.5
    echo ""
    echo "$(tput setaf 0)$(tput setab 9)  Veuillez entrer votre mot de passe :  $(tput sgr0)"
    echo "" 
    cd /home/$USER && apt update;  apt install git; git clone https://github.com/lacapsule/Maintenance
    fi

checkdir
file=/home/$USER/Maintenance
checkdir() 
if [ -f $file ]; then 
    echo ""
    echo "$(tput setaf 0)$(tput setab 9)  Le téléchargement du dépôt à réussi   $(tput sgr0)"
		sleep 3
    echo "$(tput setaf 0)$(tput setab 9)     Nous allons executer le script       $(tput sgr0)"
		sleep 1.5
    echo ""
    echo "$(tput setaf 0)$(tput setab 9) Obtention des droits sur les fichiers  $(tput sgr0)"
		sleep 1.5
		echo ""  
    cd /home/$USER/ && chmod +x -R Maintenance &&
    /home/$USER/lacapsule/./logiciel.sh
    sleep 3
else 
    echo ""
    echo "$(tput setaf 0)$(tput setab 9)  Le téléchargement du dépôt à échoué   $(tput sgr0)"
		sleep 3
    echo "$(tput setaf 0)$(tput setab 9) Vérifiez votre connexion et réessayez  $(tput sgr0)"
		sleep 5
    echo ""
	fi
}
checkdir
exit
