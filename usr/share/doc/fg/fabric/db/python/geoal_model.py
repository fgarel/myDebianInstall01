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


from sqlalchemy.ext.declarative import declarative_base
from datetime import datetime
from geoalchemy import *

metadata = MetaData(engine)
Base = declarative_base(metadata=metadata)

class Spot(Base):
    __tablename__ = 'spots'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)
    height = Column(Integer)
    created = Column(DateTime, default=datetime.now())
    geom = GeometryColumn(Point(2))

class Road(Base):
    __tablename__ = 'roads'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)
    width = Column(Integer)
    created = Column(DateTime, default=datetime.now())
    geom = GeometryColumn(LineString(2))

class Lake(Base):
    __tablename__ = 'lakes'
    id = Column(Integer, primary_key=True)
    name = Column(Unicode, nullable=False)
    depth = Column(Integer)
    created = Column(DateTime, default=datetime.now())
    geom = GeometryColumn(Polygon(2))

GeometryDDL(Spot.__table__)
GeometryDDL(Road.__table__)
GeometryDDL(Lake.__table__)
