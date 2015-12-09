{ stdenv } :

stdenv.mkDerivation {
  name = "ios_crosscompile_8_3";
  builder = ./builder.sh;
  src = ./ios_target_8_3;
  do_copy = ["bin" "libexec" "SDK"];
}
