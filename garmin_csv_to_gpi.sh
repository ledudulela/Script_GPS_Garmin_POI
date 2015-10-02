#!/bin/bash
# auteur: ledudulela
version="1.1"
# màj: 2015-10-02 17:00
# objet: Conversion de CSV ("Zones De Danger") en GPI (pour GPS Garmin)
# dépendances: gpsbabel
# origine: france
# source des fichiers CSV: site web lufop
#---------------------------------------------------------------------------------------------------------------------
# utilisation:
#--------------
# les fichiers CSV doivent se trouver dans un sous-répertoire nommé: data
# les images doivent se trouver dans un sous-répertoire nommé: images
# les fichiers .gpi générés sont à placer dans le répertoire /Garmin/POI du GPS
# -> modifier les paramètres GENERATION et PREFIX_CIBLE ci-dessous en fonction de vos préférences
#---------------------------------------------------------------------------------------------------------------------

# un indicateur temporel de génération des fichiers POI ( par exemple, année+mois des POI )
GENERATION='2015-09'

# préfixe du nom de fichier cible ( exemple pour "Zone de danger française": ZDD_FR_2015-09_ )
# tous les noms de fichiers générés commenceront par ce préfixe
PREFIXE_CIBLE="ZDD_FR_${GENERATION}_"

# répertoires utilisés pour les données et pour les images
REP_DATA="./data"
REP_IMG='./images'

# paramètre pour gpsbabel (m=metric => Km et Km:h)
UNITS='m'

# IFS est le séparateur de colonnes dans les CSV source et cible
OLDIFS=$IFS
IFS=","

# variable pour tests uniquement
FLAG_PERSO=0

# ----------------------------------
# ---  Définition de fonctions   ---
# ----------------------------------
# csvconv() convertit la source csv en un autre csv pour être compatible gpsbabel/poigarmin.gpi
csvconv() 
{ 
	# parse csv:  [ ! -f ${PATH_CSV} ] &while read COL1 COL2 COL3 do {...} done < "${PATH_CSV}"
	CSV_CIBLE="${POI_PATH}.csv"
	rm -f "${CSV_CIBLE}" # supprime le fichier cible s'il existe déjà
	if [ -f ${CSV_SOURCE} ]; then # si le fichier source existe...
		echo "- Generation de [${POI_CATEGORY}] en cours..."	
		# si les colonnes dans le fichier csv source sont: longitude, latitude, libellé
		while read POI_LONG POI_LAT POI_LIB
		do 
			# longitude et latitude sont inversées dans le nouveau fichier csv cible
			# et le POI_LIB (var locale) est remplacé par le POI_NAME (var globale)
			echo "${POI_LAT}${IFS}${POI_LONG}${IFS}${POI_NAME}" >> "${CSV_CIBLE}" 
		done < "${CSV_SOURCE}"
	else
		echo "- Le fichier source  ${CSV_SOURCE}  n'existe pas."	
	fi
}

# ------------------------------------------------------------------------------
# affiche un message au lancement du script:
echo "*** GENERATEUR DE P.O.I. GARMIN $GENERATION ( v$version ) ***"
# ------------------------------------------------------------------------------

# variables utilisées par gpsbabel et par la fonction de conversion de csv (csvconv)
# CSV_SOURCE: chemin du fichier source original
# POI_CATEGORY: la catégorie dans laquelle seront regroupés les POI dans le GPS
# POI_NAME: le nom des POI affichés dans le GPS (il sera complété par un point et un n° unique par gpsbabel)
# POI_IMG: le chemin de l'image qui sera affichée sur la carte au niveau du POI
# POI_ALERTS: si égale 1 alors le GPS affichera un message (le nom du POI) et émettra un son (ding, ding)
# POI_PROXIM: l'alarme se déclenchera en fonction de la proximité du POI
# POI_SPEED: l'alarme se déclenchera en fonction de cette vitesse à ne pas dépasser
# POI_PATH: chemin du fichier cible final

# -----------------------------------------------
# --- ALERTES ACTIVES AVEC VITESSE ET PROXIMITÉ
# -----------------------------------------------
CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 30.csv"
POI_CATEGORY='ZDD FR VITESSE MAX 30'
POI_NAME='ZDD_FR_V030'
POI_IMG="${REP_IMG}/panneau030.bmp"
POI_ALERTS=1
POI_PROXIM="0.100"
POI_SPEED="30"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 50.csv"
POI_CATEGORY='ZDD FR VITESSE MAX 50'
POI_NAME='ZDD_FR_V050'
POI_IMG="${REP_IMG}/panneau050.bmp"
POI_ALERTS=1
POI_PROXIM="0.100"
POI_SPEED="50"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 60.csv"
POI_CATEGORY='ZDD FR VITESSE MAX 60'
POI_NAME='ZDD_FR_V060'
POI_IMG="${REP_IMG}/panneau060.bmp"
POI_ALERTS=1
POI_PROXIM="0.100"
POI_SPEED="60"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 70.csv"
POI_CATEGORY='ZDD FR VITESSE MAX 70'
POI_NAME='ZDD_FR_V070'
POI_IMG="${REP_IMG}/panneau070.bmp"
POI_ALERTS=1
POI_PROXIM="0.100"
POI_SPEED="70"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 80.csv"
POI_CATEGORY='ZDD FR VITESSE MAX 80'
POI_NAME='ZDD_FR_V080'
POI_IMG="${REP_IMG}/panneau080.bmp"
POI_ALERTS=1
POI_PROXIM="0.100"
POI_SPEED="80"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 90.csv"
POI_CATEGORY='ZDD FR VITESSE MAX 90'
POI_NAME='ZDD_FR_V090'
POI_IMG="${REP_IMG}/panneau090.bmp"
POI_ALERTS=1
POI_PROXIM="0.150"
POI_SPEED="90"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 110.csv"
POI_CATEGORY='ZDD FR VITESSE MAX 110'
POI_NAME='ZDD_FR_V110'
POI_IMG="${REP_IMG}/panneau110.bmp"
POI_ALERTS=1
POI_PROXIM="0.200"
POI_SPEED="110"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 130.csv"
POI_CATEGORY='ZDD FR VITESSE MAX 130'
POI_NAME='ZDD_FR_V130'
POI_IMG="${REP_IMG}/panneau130.bmp"
POI_ALERTS=1
POI_PROXIM="0.200"
POI_SPEED="130"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

# -------------------------------------------------------------
# --- ALERTES ACTIVES MAIS SANS VITESSE, UNIQUEMENT PROXIMITE
# -------------------------------------------------------------
CSV_SOURCE="${REP_DATA}/FR Zone de danger Feu Rouge FR.csv"
POI_CATEGORY='ZDD FR FEUX TRICOLORES'
POI_NAME='ZDD_FR_FEUX'
POI_IMG="${REP_IMG}/panneauFeuTricolore.bmp"
POI_ALERTS=1
POI_PROXIM="0.100"
POI_SPEED="0"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de Danger Troncon debut FR.csv"
POI_CATEGORY='ZDD FR TRONCONS DEBUT'
POI_NAME='ZDD_FR_TRON_DEB'
POI_IMG="${REP_IMG}/panneauTronconDeb.bmp"
POI_ALERTS=1
POI_PROXIM="0.150"
POI_SPEED="0"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de Danger Troncon fin FR.csv"
POI_CATEGORY='ZDD FR TRONCONS FIN'
POI_NAME='ZDD_FR_TRON_FIN'
POI_IMG="${REP_IMG}/panneauTronconFin.bmp"
POI_ALERTS=1
POI_PROXIM="0.150"
POI_SPEED="0"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

# -------------------------------------------------------------------------
# --- ALERTES INACTIVES (SANS VITESSE, SANS PROXIMITE, UNIQUEMENT L IMAGE)
# -------------------------------------------------------------------------
CSV_SOURCE="${REP_DATA}/FR Zone de danger Temporaire FR.csv"
POI_CATEGORY='ZDD FR TEMPORAIRES'
POI_NAME='ZDD_FR_TMP'
POI_IMG="${REP_IMG}/panneauAttention.bmp"
POI_ALERTS=0
POI_PROXIM="0.0"
POI_SPEED="0"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR Passage Niveau.csv"
POI_CATEGORY='ZDD FR PASSAGES A NIVEAU'
POI_NAME='ZDD_FR_PASS_NIV'
POI_IMG="${REP_IMG}/panneauAttention.bmp"
POI_ALERTS=0
POI_PROXIM="0.0"
POI_SPEED="0"
POI_PATH="$REP_DATA/${PREFIXE_CIBLE}${POI_NAME}"
echo $(csvconv)
gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"

# -----------------------------------------------
# --- POUR TEST POI PERSO
# -----------------------------------------------
if [ $FLAG_PERSO != 0 ]; then
	CSV_SOURCE="${REP_DATA}/Mes Poi Favoris.csv"
	POI_CATEGORY='MES POI FAVORIS'
	POI_NAME='POI_FAVOR'
	POI_IMG="${REP_IMG}/panneauEpingle.bmp"
	POI_ALERTS=1
	POI_PROXIM="0.100"
	POI_SPEED="0"
	POI_PATH="$REP_DATA/${POI_NAME}_${GENERATION}"
	echo $(csvconv)
	gpsbabel -w -i csv -f "${POI_PATH}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORY",alerts="$POI_ALERTS",proximity=${POI_PROXIM},sleep=1,unique=1,units=${UNITS},hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${POI_PATH}.gpi"
fi

# --------------------------------------------------------------------------------------------
IFS=$OLDIFS
echo "Fin des traitements."
echo "Les fichiers se trouvent dans le répertoire ${REP_DATA}"
echo ""
exit 0

