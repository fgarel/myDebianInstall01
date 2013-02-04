#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Ce petit script permet de simplifier les tests pythons
"""

import subprocess
import argparse
#import re

class MyPyLint(argparse.Action):
    """
    Cette classe correspont à la cible
    en argument, on done un nom de fichier
    """
    def __call__(self, parser, namespace, values, option_string=None):
        """
        La fonction __call__ d'une classe est apellée
        lorque la classe est appellée....
        """
        #print '%r %r %r' % (namespace, values, option_string)
        __p1__ = subprocess.Popen(['pylint', values],
                                  stdout=subprocess.PIPE,
                                  )
        # suppression des lignes
        #   vides ou
        #   commençant par
        #     + ou | ou - ou = ou : ou *
        #     Report ou Raw ou Statistics ou External
        #     Messages ou Global ou Duplication
        __p2__ = subprocess.Popen(['grep', '-v', '-E',
                                   '-e', '^(\+|\||\-|\=|:|\*|$)',
                                   '-e', '^[ ]+.*$',
                                   '-e', '^[0-9]* statements analysed.$',
                                   '-e', '^(Report|Raw|Statistics)',
                                   '-e', '^(External|Duplication)',
                                   '-e', '^(Messages|Global)'],
                                  stdin=__p1__.stdout,
                                  stderr=subprocess.STDOUT,
                                  stdout=subprocess.PIPE,
                                  )
        __p3__ = subprocess.Popen(['sed', '-r',
                                   '-e', 's/Your code has been rated at //g',
                                   '-e', 's/([0-9.]*)\/10.*/\\1/g'],
                                  stdin=__p2__.stdout,
                                  stderr=subprocess.STDOUT,
                                  stdout=subprocess.PIPE,
                                  )
        __p1__.stdout.close()
        #__p2__.stdout.close()
        __output3__, __error3__ = __p3__.communicate()
        # on supprime le dernier caractère (qui est un retour chariot)
        # et comme __output3__ peut etre vu comme une liste
        # on n'utilise pas strip() mais on manipule plutot une liste
        __output3__ = __output3__[:-1]
        #__output3__ = __output3__.strip()
        print __output3__

def main():
    """
    Création d'un parser
    """
    # creation du parser
    __parser__ = argparse.ArgumentParser(
                 description="Utilitaire pour simplifier les tests python")
    __parser__.add_argument("file",
                            help="Nom du fichier python à auditer",
                            action=MyPyLint)
    #__args__ = __parser__.parse_args()
    #print __args__.file


if __name__ == '__main__':
    main()
