#!/usr/bin/env python
# -*- coding: utf-8 -*-
# licence GPL
# $Id: $

""" Utilisation de la connection à une base postgresql

On se connecte à une base postgresql en python grace à geoalchemy

utilisation de postgis
garel$ su
root# su postgres
postgres$ createuser -d -R -S -P fred
Saisir le mot de passe pour le nouveau role : fred
Le saisir de nouveau : fred
postgres$ createdb -E UTF8 -O fred urbanisme   
postgres$ createlang -d urbanisme plpgsql
postgres$ psql -d urbanisme \
               -f /usr/share/postgresql/8.4/contrib/postgis.sql
postgres$ psql -d urbanisme \
               -f /usr/share/postgresql/8.4/contrib/postgis_comments.sql
postgres$ psql -d urbanisme \
               -f /usr/share/postgresql/8.4/contrib/spatial_ref_sys.sql
postgres$ psql -d urbanisme -c "grant select on spatial_ref_sys to fred;"
postgres$ psql -d urbanisme -c "grant all on geometry_columns to fred;"
postgres$ exit
root# exit

"""

__author__ = "Frédéric Garel <fgarel@free.fr>"
__date__ = "26 Jan 2010"
__version__ = "$Revision: 1.5 $"
__credits__ = """Thanks to ... for his help on this module"""



from sqlalchemy import *
from sqlalchemy.orm import *

engine = create_engine('postgres://fred:fred@localhost/urbanisme', echo=True)
Session = sessionmaker(bind=engine)
session = Session()
