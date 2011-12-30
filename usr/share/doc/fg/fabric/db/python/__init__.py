#! /usr/bin/env python
# -*- coding: utf-8 -*-
# licence GPL

# $Id: $
__author__ = "Frédéric Garel <fgarel@free.fr>"
__date__ = "26 Jan 2010"
__version__ = "$Revision: 1.5 $"
__credits__ = """Thanks to ... for his help on this module"""

"""File utilities

Files utilities like search and replace, etc
"""
# file/__init__.py - initialization of the file module
#
# Copyright (C) 2010 Frédéric Garel <fgarel@free.fr>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.

# Import modules needed by _psycopg to allow tools like py2exe to do
# their work without bothering about the module dependencies.
# 
# TODO: we should probably use the Warnings framework to signal a missing
# module instead of raising an exception (in case we're running a thin
# embedded Python or something even more devious.)


__all__ = [ k for k in locals().keys() if not k.startswith('_') ]