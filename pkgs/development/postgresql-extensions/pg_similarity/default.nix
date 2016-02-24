# with import <nixpkgs> { };

{ stdenv, fetchFromGitHub, gcc, postgresql } :

stdenv.mkDerivation rec {
  name = "pg_similarity";
  src = fetchFromGitHub {
    owner = "eulerto";
    repo = "pg_similarity";
    rev = "adacf8ab8f6ed8304ff4c5dcffbf0378656091e1";
    sha256 = "1a40n405d37ichwmnz57wasb03jp7jiygac98zxdqr1zlkmjy4rd";
  };
  builder = ./builder.sh;
  buildInputs = [ postgresql gcc ];
  meta = {
    description = "Some functions";
    platforms = stdenv.lib.platforms.linux;
    license = stdenv.lib.licenses.gpl2;
  };
}
