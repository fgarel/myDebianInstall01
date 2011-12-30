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


import sys
from db.python import connectpython

class ManipulatePython():
    """ ManipulatePython est une classe offrant de nombreuses méthodes
    permettant de manipuler
    aisement les données stockées dans une base de données 
    posgresql avec l'extension postgis

    ManipulatePython regroupe les méthodes qui permettent de manipuler
    les données en langage Python (pas de shell ni de fabric)

    ManipulateShell regoupe les méthodes qui permettent de manipuler
    les données en shell (pgsql, shp2pgsql, fabric, ...)
    
    """
    def __init__(self):
        """  initialisation de la classe
        """
        pass

    def __call__(self):
        """  appel de la clasee
        """
        #print 'call'
        self.test()

    def select(self):
        """ Connection à une base et parcours d'une table
    
        connection à la base definie dans connect.py
        parcours de la table bureau_vote
        """
        # Connect to the database.
        #module, conn = connectpython.ConnectPython.connect_dbapi(self)
        conn = connectpython.ConnectPython.connect_dbapi(self)    
        cursor = conn.cursor()
    
        try:
            cursor.execute("""SELECT * from bureau_vote""")
            conn.commit()
        except cursor.Error:
            print("I can't select from table bureau_vote database,", \
                  "check your isolation level.")
            sys.exit()

        rows = cursor.fetchall()

        print "\nShow me the databases:\n"
        for row in rows:
            print "   ", row[0], row[1], row[2]

        # make sure we're authenticated

    def test(self):
        """ methode pour test
        """
        print "ManipulatePython.test"

def main():
    """ main permet d'instancier un objet de la classe ManipulatePython
    """
    # Creation de l'instance
    _mymanipulatepython = ManipulatePython()
    _mymanipulatepython.test()

if __name__ == '__main__':
    main()




