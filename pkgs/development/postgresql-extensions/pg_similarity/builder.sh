# -*- shell-script -*-
source $stdenv/setup

chmod -R 755 $src

chmod -R 755 $(pg_config --libdir)
chmod -R 755 $(pg_config --sharedir)

cd $src

USE_PGXS=1 make
USE_PGXS=1 make install

cp pg_similarity.control $(pg_config --sharedir)/extension

mkdir -p $out
