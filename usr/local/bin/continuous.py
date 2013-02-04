#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Ce petit script permet de surveiller la création d'un fichier .tex
ou d'un fichier .py
dans un répertoire
cf http://www.planet-libre.org/?post_id=13392
"""

import os
import time
import subprocess
import pynotify
from gobject import GError

from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler


class ChangeHandler(FileSystemEventHandler):
    """React to modified .tex files."""
    #def on_any_event(self, event):
    def on_any_event(self, event):
        """If a file or folder is changed."""
        if event.is_directory:
            return
        if os.path.splitext(event.src_path)[-1].lower() == ".tex":
            pynotify.init("Mon appli python")
            try:
                subprocess.check_call(['xelatex', \
                                       '-halt-on-error' , \
                                       'thesis.tex'])
            except subprocess.CalledProcessError:
                message = pynotify.Notification("Build failed.")
            else:
                message = pynotify.Notification("Build done.")
            try:
                message.show()
            except GError:
                print('Gerror')
        if os.path.splitext(event.src_path)[-1].lower() == ".py":
            pynotify.init("Mon appli python")
            try:
                #__p1__ = subprocess.Popen(['./mypylint.py', \
                __p1__ = subprocess.Popen(['mypylint.py', \
                                           event.src_path],
                                          stdout=subprocess.PIPE,
                                         )
                # ici le deuxieme processus ne sert pas
                # mais est laissé pour l'exemple
                __p2__ = subprocess.Popen(['sed', '-r',
                                   '-e', 's/\./\./g'],
                                  stdin=__p1__.stdout,
                                  stderr=subprocess.STDOUT,
                                  stdout=subprocess.PIPE,
                                  )
                __p1__.stdout.close()
                __output2__, __error2__ = __p2__.communicate()
            except subprocess.CalledProcessError:
                message = pynotify.Notification("Check failed.")
            else:
                #__notification__ = __output2__
                message = pynotify.Notification("Check done", __output2__)
            try:
                message.show()
            except GError:
                print('Gerror')
                #pass


def main():
    """
    un handler est une routine qui va gérer une situation particulière
    comme une exception dans un processus.
    Pour programmer un handler, il faut définir une fonction qui va traiter
    le signal reçu par un processus.
    Ici, la fonction est dans la classe ChangeHandler
    """
    handler = ChangeHandler()
    observer = Observer()
    observer.schedule(handler, '.')
    observer.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()


if __name__ == '__main__':
    main()
