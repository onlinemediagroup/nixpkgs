{ stdenv, fetchgit }:

let version = "2015-12-14"; in
stdenv.mkDerivation {
  name = "wireless-regdb-${version}";

  src = fetchgit {
    sha256 = "1ldfcxn3mdb104czy78b7nj1clsbfp8fc6mshix98zq0bg4k7rsm";
    url = https://git.kernel.org/pub/scm/linux/kernel/git/sforshee/wireless-regdb.git;
    rev = "refs/tags/master-${version}";
  };

  phases = [ "unpackPhase" "installPhase" ];

  makeFlags = [
    "DESTDIR=$(out)"
    "PREFIX="
  ];

  meta = with stdenv.lib; {
    inherit version;
    description = "Wireless regulatory database for CRDA";
    homepage = http://wireless.kernel.org/en/developers/Regulatory/;
    license = licenses.isc;
    platforms = platforms.all;
    maintainers = with maintainers; [ nckx ];
  };
}
