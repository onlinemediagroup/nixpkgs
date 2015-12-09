source $stdenv/setup

for dir in $do_copy
do
    mkdir -p $out/$dir
    cp -R $src/$dir $out
done
