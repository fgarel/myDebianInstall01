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


from db.python import connectpython

class InputOutputPython():
    """ InputOutputPython est une classe offrant de nombreuses méthodes
    permettant de manipuler
    aisement les données stockées dans une base de données 
    posgresql avec l'extension postgis

    InputOuputPython regroupe les méthodes qui permettent d'importer
    et d'exporter les données en langage Python (pas de shell ni de fabric)

    InputOuputShell regoupe les méthodes qui permettent d'importer
    et d'exporter les données en shell (pgsql, shp2pgsql, fabric, ...)
    
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
        
    def csv2psql(self):
        """ import d'un fichier csv dans une table postgresql
        """
        pass
        
    def psql2csv(self):
        """ export d'une table postgresql vers un fichier csv
        """
        pass

    def shp2psql(self):
        """ import d'un fichier shape dans une table postgresql
        """
        pass
        
    def psql2shp(self):
        """ export d'une table postgresql vers un fichier shape
        """
        pass

    def test(self):
        """ methode pour test
        """
        print "InputOutputPython.test"


def main():
    """ main permet d'instancier un objet de la classe InputOutputPython
    """
    # Creation de l'instance
    _myinputoutputpython = InputOutputPython()
    _myinputoutputpython.test()

if __name__ == '__main__':
    main()



