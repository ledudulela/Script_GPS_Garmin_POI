#!/bin/bash
# auteur: ledudulela
# version="1.0"
# màj: 2015-10-01 17:00
# objet: Conversion de zones de danger CSV en GPI (pour GPS Garmin)
# dépendances: gpsbabel
# source des fichiers CSV: site web lufop
#---------------------------------------------------------------------------------------------------------------------
# utilisation:
# les fichiers CSV doivent se trouver dans un sous-répertoire nommé: data
# les images doivent se trouver dans un sous-répertoire nommé: images
# les fichiers .gpi générés sont à placer dans le répertoire /Garmin/POI du GPS
# -> modifier le paramètre VERSION ci-dessous en fonction de vos préférences

# un identifiant de version de fichier POI (par exemple, l'année des POI+mois)
VERSION='2015-09'

# répertoires utilisés pour les données et pour les images
REP_DATA="./data"
REP_IMG='./images'

# modèle de nom de fichier généré
URL="$REP_DATA/ZDD_${VERSION}_FR_"

# pour parser le CSV
OLDIFS=$IFS
IFS=","

# --------------------------------
# ---  Définition de fonction  ---
# --------------------------------
# converti la source csv en un autre csv pour être compatible gpsbabel/garmin.gpi
# en permutant longitude et latitude et en changeant le nom des POI
csvconv() 
{ 
	echo "- Generation de [${POI_CATEGORIE}] en cours..."	
	rm -f "${CIBLE}.csv"
	[ ! -f ${CSV_SOURCE} ] &while read POI_LONGITUDE POI_LATITUDE POI_LIBELLE
	do 
		echo "${POI_LATITUDE},${POI_LONGITUDE},${POI_PREFIX}" >> "${CIBLE}.csv" 
	done < "${CSV_SOURCE}"

}

# -------------------------------------------------------------
echo "********* GENERATION DE POI GARMIN - $VERSION *********"
# -------------------------------------------------------------

CSV_SOURCE="${REP_DATA}/Mes Poi Favoris.csv"
POI_CATEGORIE='MES POI FAVORIS'
POI_PREFIX='POI_FAVOR'
POI_IMG="${REP_IMG}/panneauEpingle.bmp"
POI_PROXIM="0.025"
CIBLE="$REP_DATA/MESPOIFAVORIS_${VERSION}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"


# ALERTE AVEC VITESSE ET PROXIMITÉ
CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 30.csv"
POI_CATEGORIE='ZDD FR VITESSE MAX 30'
POI_PREFIX='ZDD_FR_V030'
POI_IMG="${REP_IMG}/panneau030.bmp"
POI_PROXIM="0.025"
POI_SPEED="30"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 50.csv"
POI_CATEGORIE='ZDD FR VITESSE MAX 50'
POI_PREFIX='ZDD_FR_V050'
POI_IMG="${REP_IMG}/panneau050.bmp"
POI_PROXIM="0.025"
POI_SPEED="50"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 60.csv"
POI_CATEGORIE='ZDD FR VITESSE MAX 60'
POI_PREFIX='ZDD_FR_V060'
POI_IMG="${REP_IMG}/panneau060.bmp"
POI_PROXIM="0.025"
POI_SPEED="60"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 70.csv"
POI_CATEGORIE='ZDD FR VITESSE MAX 70'
POI_PREFIX='ZDD_FR_V070'
POI_IMG="${REP_IMG}/panneau070.bmp"
POI_PROXIM="0.025"
POI_SPEED="70"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 80.csv"
POI_CATEGORIE='ZDD FR VITESSE MAX 80'
POI_PREFIX='ZDD_FR_V080'
POI_IMG="${REP_IMG}/panneau080.bmp"
POI_PROXIM="0.050"
POI_SPEED="80"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 90.csv"
POI_CATEGORIE='ZDD FR VITESSE MAX 90'
POI_PREFIX='ZDD_FR_V090'
POI_IMG="${REP_IMG}/panneau090.bmp"
POI_PROXIM="0.050"
POI_SPEED="90"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 110.csv"
POI_CATEGORIE='ZDD FR VITESSE MAX 110'
POI_PREFIX='ZDD_FR_V110'
POI_IMG="${REP_IMG}/panneau110.bmp"
POI_PROXIM="0.050"
POI_SPEED="110"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR 130.csv"
POI_CATEGORIE='ZDD FR VITESSE MAX 130'
POI_PREFIX='ZDD_FR_V130'
POI_IMG="${REP_IMG}/panneau130.bmp"
POI_PROXIM="0.050"
POI_SPEED="130"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},speed=${POI_SPEED},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

# ALERTE MAIS SANS VITESSE, UNIQUEMENT PROXIMITÉ
CSV_SOURCE="${REP_DATA}/FR Zone de danger Feu Rouge FR.csv"
POI_CATEGORIE='ZDD FR FEUX TRICOLORES'
POI_PREFIX='ZDD_FR_FEUX'
POI_IMG="${REP_IMG}/panneauFeuTricolore.bmp"
POI_PROXIM="0.025"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de Danger Troncon debut FR.csv"
POI_CATEGORIE='ZDD FR TRONCONS DEBUT'
POI_PREFIX='ZDD_FR_TRON_DEB'
POI_IMG="${REP_IMG}/panneauTronconDeb.bmp"
POI_PROXIM="0.025"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de Danger Troncon fin FR.csv"
POI_CATEGORIE='ZDD FR TRONCONS FIN'
POI_PREFIX='ZDD_FR_TRON_FIN'
POI_IMG="${REP_IMG}/panneauTronconFin.bmp"
POI_PROXIM="0.025"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=1,proximity=${POI_PROXIM},sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

# SANS ALERTE (SANS VITESSE, SANS PROXIMITÉ)
CSV_SOURCE="${REP_DATA}/FR Zone de danger Temporaire FR.csv"
POI_CATEGORIE='ZDD FR TEMPORAIRES'
POI_PREFIX='ZDD_FR_TMP'
POI_IMG="${REP_IMG}/panneauAttention.bmp"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=0,sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

CSV_SOURCE="${REP_DATA}/FR Zone de danger FR Passage Niveau.csv"
POI_CATEGORIE='ZDD FR PASSAGES A NIVEAU'
POI_PREFIX='ZDD_FR_PASS_NIV'
POI_IMG="${REP_IMG}/panneauAttention.bmp"
CIBLE="${URL}${POI_PREFIX}"
echo $(csvconv)
gpsbabel -w -i csv -f "${CIBLE}.csv" -o garmin_gpi,bitmap="${POI_IMG}",category="$POI_CATEGORIE",alerts=0,sleep=1,unique=1,units=m,hide=0,descr=0,notes=0,position=0,snwhite=0,snupper=0,snunique=0,prefer_shortnames=0 -F "${CIBLE}.gpi"

# -----------------------------------------------------------
IFS=$OLDIFS
echo "Fin des traitements. Les fichiers se trouvent dans le répertoire ${REP_DATA}"
