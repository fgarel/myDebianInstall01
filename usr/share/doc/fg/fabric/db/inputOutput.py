#! /usr/bin/env python
# -*- coding: utf-8 -*-
# licence GPL
# $Id: $


"""This module's docstring summary line.

This is a multi-line docstring. Paragraphs are separated with blank lines. 
Lines conform to 79-column limit. 

Module and packages names should be short, lower_case_with_underscores.

See http://www.python.org/dev/peps/pep-0008/ for more PEP-8 details and
http://wwd.ca/blog/2009/07/09/pep-8-cheatsheet/ for an up-to-date version
of this cheatsheet.

Created on 26 janv. 2010

@author: garel
"""

__author__ = "Frédéric Garel <fgarel@free.fr>"
__date__ = "26 Jan 2010"
__version__ = "$Revision: 1.5 $"
__credits__ = """Thanks to ... for his help on this module"""

from fabric.api import local
import re



class FabricPostgis():
    """ fabric_postgis est une classe offrant de nombreuses méthodes
    permettant de manipuler
    aisement les données stockées dans une base de données 
    posgresql avec l'extension postgis

    
    
    """
    def __init__(self):
        """  initialisation de la clasee
        """
        pass

def create_database(database=''):
    """ create_database est une methode
    Creation d'une base de données postigs
    """
    # creation d'un fichier de connexion belier d'apres un template : \
    #   c'est à dire personnalisation du fichier /etc/belier/localhost
    
    # execution du script belier : creation de la base
    #print database
    if database == "":
        # creation d'un fichier de connexion belier d'apres un template : \
        #   c'est à dire personnalisation du fichier /etc/belier/localhost
    
        # execution du script belier : creation de la base
        local('bel -e /etc/belier/localhost -d 1', \
              capture=False)
        local('./localhost.sh' , capture=False)
        local('rm localhost.sh', capture=False)
    else:
        # ici, on fait au préalable un recherche remplace
        local('sed s/mydb/' + database + \
              "/ /etc/belier/localhost > localhost", \
              capture=False)
        local('bel -e localhost -d 1', \
              capture=False)
        local('./localhost.sh' , capture=False)
        local('rm localhost.sh', capture=False)
        local('rm localhost', capture=False)


def shp2pgsql(filename='', srid='27562', encodage='LATIN1'):
    """  shp2pgsql methode pour convertir des fichiers shape
    en instruction sql, puis en jouant ce fichier sql sous postgis
    """
    shapefile = filename
    basename = re.sub('.shp', '', filename)
    sqlfile = re.sub('.shp', '.sql', filename)
    # lancement de la commande shp2pgsql 
    local('shp2pgsql ' + \
           '-s ' + srid + ' ' + \
           '-W ' + encodage + ' ' + \
           shapefile + ' ' + \
           basename + ' ' + \
           '> ' + sqlfile, \
           capture=False)
    
def shp2pgsql2(filename=''):
    """  shp2pgsql2 est un wrapper pour la méthode precedente
    """
    shp2pgsql(filename, '27562', 'LATIN1')

def csv2pgsql(header='data_header.sql', data='data.txt'):
    """ csv2pgsql est une methode permettant d'importer facilement des
    fichiers csv au sein d'une table posgis
    """
    local('touch temp.sql', capture=False)
    local('rm temp.sql', capture=False)
    local('cat ' + header + ' ' + data + ' >> temp.sql', capture=False)
    local('psql -d mydb \
           -U fred \
           -f temp.sql \
           > /dev/null \
           2> /dev/null', \
           capture=False)
    local('rm temp.sql', capture=False)

def import_data():
    """ import_data est une methode
    import des données dans la base précedemment créée
    """
    # transformation des fichiers dont l'encodage est en latin1
    # vers un encodage en utf-8
    
    # le 1er essai consistait a recoder directement les fichiers shape, 
    # et/ou dbf
    # puis à lancer l'import avec ogr2ogr.
    # cette premiere methode ne sembre pas fonctionner de manière systématique.
    
    # la seconde méthode consiste à executer d'abord l'utilitaire shp2pgsql
    # qui a pour effet de generer un fichier texte (sql)
    # et nous pourrons plus facilement reencoder ce fichier

    # reste de la méthode 1
    # police_surface_comite_quartier_special_police.shp
    #local('recode l1..utf-8 \
    #       < ~/f/GEOMATIQUE/police/shape/
    #          police_surface_comite_quartier_special_police.shp \
    #       > ~/f/GEOMATIQUE/police/shape/
    #          police_surface_comite_quartier_special_police8.shp', \
    #       capture=False)
    #local('recode l1..utf-8 \
    #       < ~/f/GEOMATIQUE/police/shape/
    #          police_surface_comite_quartier_special_police.dbf \
    #       > ~/f/GEOMATIQUE/police/shape/
    #          police_surface_comite_quartier_special_police8.dbf', \
    #       capture=False)
    #local('cp ~/f/GEOMATIQUE/police/shape/
    #           police_surface_comite_quartier_special_police.shx \
    #       ~/f/GEOMATIQUE/police/shape/
    #        police_surface_comite_quartier_special_police8.shx', \
    #       capture=False)

    # voirie_filaire_troncon.shp
    #local('recode utf-8..utf-8 \
    #       < ~/f/GEOMATIQUE/police/shape/voirie_filaire_troncon.shp \
    #       > ~/f/GEOMATIQUE/police/shape/voirie_filaire_troncon8.shp', \
    #       capture=False)
    #local('recode l1..utf-8 \
    #       < ~/f/GEOMATIQUE/police/shape/voirie_filaire_troncon.dbf \
    #       > ~/f/GEOMATIQUE/police/shape/voirie_filaire_troncon8.dbf', \
    #       capture=False)
    #local('recode utf-8..utf-8 \
    #       ~/f/GEOMATIQUE/police/shape/voirie_filaire_troncon.shx \
    #       ~/f/GEOMATIQUE/police/voirie_filaire_troncon8.shx', \
    #       capture=False)
    
    # voirie_filaire_voie.shp
    #local('recode l1..utf-8 \
    #       < ~/f/GEOMATIQUE/police/shape/voirie_filaire_voie.shp \
    #       > ~/f/GEOMATIQUE/police/shape/voirie_filaire_voie8.shp', \
    #       capture=False)
    #local('recode l1..utf-8 \
    #       < ~/f/GEOMATIQUE/police/shape/voirie_filaire_voie.dbf \
    #       > ~/f/GEOMATIQUE/police/shape/voirie_filaire_voie8.dbf', \
    #       capture=False)
    #local('cp ~/f/GEOMATIQUE/police/shape/voirie_filaire_voie.shx \
    #       ~/f/GEOMATIQUE/police/voirie_filaire_voie8.shx', \
    #       capture=False)
    
    # execution de la commande shp2Postgis.sh
    #local('~/travail/docInterne/ogr2ogr/shp2Postgis.sh \
    #       ~/f/GEOMATIQUE/police/shape/
    #        police_surface_comite_quartier_special_police8.shp', \
    #       capture=False)
    #local('~/travail/docInterne/ogr2ogr/shp2Postgis.sh \
    #       ~/f/GEOMATIQUE/police/shape/voirie_filaire_troncon8.shp', \
    #       capture=False)
    #local('~/travail/docInterne/ogr2ogr/shp2Postgis.sh \
    #       ~/f/GEOMATIQUE/police/shape/voirie_filaire_voie8.shp', \
    #       capture=False)
    
    # suppression des fichiers utf8
    #local('rm ~/f/GEOMATIQUE/police/shape/
    #           police_surface_comite_quartier_special_police8.shp', \
    #       capture=False)
    #local('rm ~/f/GEOMATIQUE/police/shape/
    #           police_surface_comite_quartier_special_police8.dbf', \
    #       capture=False)
    #local('rm ~/f/GEOMATIQUE/police/shape/
    #           police_surface_comite_quartier_special_police8.shx', \
    #       capture=False)
    #local('rm ~/f/GEOMATIQUE/police/shape/voirie_filaire_troncon8.shp', \
    #       capture=False)
    #local('rm ~/f/GEOMATIQUE/police/shape/voirie_filaire_troncon8.dbf', \
    #       capture=False)
    #local('rm ~/f/GEOMATIQUE/police/shape/voirie_filaire_troncon8.shx', \
    #       capture=False)
    #local('rm ~/f/GEOMATIQUE/police/shape/voirie_filaire_voie8.shp', \
    #       capture=False)
    #local('rm ~/f/GEOMATIQUE/police/shape/voirie_filaire_voie8.dbf', \
    #       capture=False)
    #local('rm ~/f/GEOMATIQUE/police/shape/voirie_filaire_voie8.shx', \
    #       capture=False)

    # methode 2
    # lancement de la commande shp2pgsql
    local('shp2pgsql \
           -s 27562 \
           -W LATIN1 \
           ~/f/GEOMATIQUE/police/shape/police_surface_comite_quartier_special_police.shp \
           police_surface_comite_quartier_special_police \
           > ~/travail/policeMunicipale/police_surface_comite_quartier_special_police.sql', \
           capture=False)
    local('shp2pgsql \
           -s 27562 \
           -W LATIN1 \
           ~/f/GEOMATIQUE/police/shape/voirie_filaire_troncon.shp \
           voirie_filaire_troncon \
           > ~/travail/policeMunicipale/voirie_filaire_troncon.sql', \
           capture=False)
    local('shp2pgsql \
           -s 27562 \
           -W LATIN1 \
           ~/f/GEOMATIQUE/police/shape/voirie_filaire_voie.shp \
           voirie_filaire_voie \
           > ~/travail/policeMunicipale/voirie_filaire_voie.sql', \
           capture=False)
    # puis on recode ce fichier sql
    #local('recode l1..utf-8 \
    #       < ~/travail/policeMunicipale/
    #          police_surface_comite_quartier_special_police.sql \
    #       > ~/travail/policeMunicipale/
    #          police_surface_comite_quartier_special_police8.sql', \
    #       capture=False)
    #local('recode l1..utf-8 \
    #       < ~/travail/policeMunicipale/voirie_filaire_troncon.sql \
    #       > ~/travail/policeMunicipale/voirie_filaire_troncon8.sql', \
    #       capture=False)
    #local('recode l1..utf-8 \
    #       < ~/travail/policeMunicipale/voirie_filaire_voie.sql \
    #       > ~/travail/policeMunicipale/voirie_filaire_voie8.sql', \
    #       capture=False)
    # puis on execute ce fichier sql
    local('psql -d mydb \
           -U fred \
           -f ~/travail/policeMunicipale/police_surface_comite_quartier_special_police.sql \
           > /dev/null \
           2> /dev/null', \
           capture=False)
    local('psql -d mydb \
           -U fred \
           -f ~/travail/policeMunicipale/voirie_filaire_troncon.sql \
           > /dev/null \
           2> /dev/null', \
           capture=False)
    local('psql -d mydb \
           -U fred \
           -f ~/travail/policeMunicipale/voirie_filaire_voie.sql \
           > /dev/null \
           2> /dev/null', \
           capture=False)
    # suppression des fichiers temporaires
    local('rm ~/travail/policeMunicipale/police_surface_comite_quartier_special_police.sql', \
           capture=False)
    local('rm ~/travail/policeMunicipale/voirie_filaire_troncon.sql', \
           capture=False)
    local('rm ~/travail/policeMunicipale/voirie_filaire_voie.sql', \
           capture=False)
    #pass

def manipulate_data(sqlfile=''):
    """ manipulate_data est une methode
    Manipulation, traitement des données
    """
    if sqlfile == "":
        local('psql -d mydb \
               -U fred \
               -f ~/travail/docInterne/postgis/manipulate_data.sql \
               > /dev/null \
               2> /dev/null', \
               capture=False)
    else:
        local('psql -d mydb \
               -U fred \
               -f ' + sqlfile + ' \
               > /dev/null \
               2> /dev/null', \
               capture=False)

def export_data():
    """ export_data est une methode
    Export des resultats
    """
    # export des tables en utilisant l'utilitaire pgsql2shp
    local('pgsql2shp \
           -h localhost \
           -u fred \
           -f ~/travail/policeMunicipale/police_surface_comite_quartier_special_police \
           mydb \
           police_surface_comite_quartier_special_police', \
           capture=False)
    local('pgsql2shp \
           -h localhost \
           -u fred \
           -f ~/travail/policeMunicipale/voirie_filaire_troncon \
           mydb \
           voirie_filaire_troncon', \
           capture=False)
    local('pgsql2shp \
           -h localhost \
           -u fred \
           -f ~/travail/policeMunicipale/voirie_filaire_voie \
           mydb \
           voirie_filaire_voie', \
           capture=False)
    local('pgsql2shp \
           -h localhost \
           -u fred \
           -f ~/travail/policeMunicipale/result \
           mydb \
           result', \
           capture=False)
    #pass
    
def drop_database():
    """ drop_database est une methode
    Suppression de la base
    """
    pass


def do_all():
    """ do_all est une methode
    Enchainement des différentes étapes listées ci-dessus
    """
    create_database()
    import_data()
    manipulate_data()
    export_data()
    drop_database()

def do_majic():
    """ do_majic est une méthode
    pour la manipulation des fichiers majic de la dgfip
    """
    create_database('majic')
    csv2pgsql('data_header.sql', 'data.txt')

def main():
    """ main permet d'instancier un objet de la classe fabric_postgis
    """
    pass

if __name__ == '__main__':
    main()

