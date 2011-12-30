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


# import des modules dans le sous-repertoire courant
from usecase import police
from usecase import majic
# import des modules dans un repertoire frere
#import os, sys
#sys.path.append(os.path.join(os.getcwd(), '..'))


class Fabric():
    """ classe
    permettant de manipuler
    aisement les données stockées dans une base de données 
    posgresql avec l'extension postgis

    """
    def __init__(self):
        """  initialisation de la clasee
        """
        self.dbhost = 'localhost'
        self.dbport = '5432'
        self.dbname = 'mydb'
        self.dbuser = 'fred'
        self.dpbass = 'fred'
        #print 'init'
        
    def __call__(self):
        """  appel de la clasee
        """
        #print 'call'
        self.test()     

    def usecase(self, cas=None):
        """ usecase permet d'executer un cas d'utilisation
        """
        if cas == 'police':
            #Police.do_all(self)
            police.main()
        elif cas == 'majic':
            #Majic.do_all(self)
            majic.main()
        else:
            pass

    def test(self):
        """ methode pour test
        """
        print "Fabric.test"

def main():
    """ main permet d'instancier un objet de la classe Fabric
    """
    _fabric = Fabric()
    #myfabric.usecase(cas='police')
    _fabric.usecase(cas='majic')

if __name__ == '__main__':
    main()

