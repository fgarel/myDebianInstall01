#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Ce petit script permet de simplifier les tests pythons
"""

import subprocess
import argparse


class MyPyLint(argparse.Action):
    """
    Cette classe correspont à la cible
    en argument, on done un nom de fichier
    """
    def __call__(self, parser, namespace, values, option_string=None):
        #print '%r %r %r' % (namespace, values, option_string)
        __p1__ = subprocess.Popen(['pylint', values],
                                  stdout=subprocess.PIPE,
                                  )
        __p2__ = subprocess.Popen(['grep', '-v', '-E', 
                                   '-e', '^(\+|\||\-|\=|$)',
                                   '-e', '^(Report|Raw|Statistics)',
                                   '-e', '^(Messages|Global|Duplication)'],
                                  stdin=__p1__.stdout,
                                  stderr=subprocess.STDOUT,
                                  stdout=subprocess.PIPE,
                                  )
        __p1__.stdout.close()
        __output2__, __error2__ = __p2__.communicate()

        print __output2__

# creation du parser
__parser__ = argparse.ArgumentParser(
                      description="Utilitaire pour simplifier les tests python")
__parser__.add_argument("file",
                        help="Nom du fichier python à auditer",
                        action=MyPyLint)
__args__ = __parser__.parse_args()
print __args__.file
