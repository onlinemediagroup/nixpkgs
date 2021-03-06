{ stdenv, fetchurl, acl, libcap }:

stdenv.mkDerivation rec {
  name = "cdrtools-3.02a03";

  src = fetchurl {
    url = "mirror://sourceforge/cdrtools/${name}.tar.bz2";
    sha256 = "02gjxib0sgzsdicnb7496x0a175w1sb34v8zc9mdi8cfw7skw996";
  };

  patches = [ ./fix-paths.patch ];

  buildInputs = [ acl libcap ];

  configurePhase = "true";

  GMAKE_NOWARN = true;

  makeFlags = [ "INS_BASE=/" "INS_RBASE=/" "DESTDIR=$(out)" ];

  meta = with stdenv.lib; {
    homepage = http://sourceforge.net/projects/cdrtools/;
    description = "Highly portable CD/DVD/BluRay command line recording software";
    # Licensing issues: This package contains code licensed under CDDL, GPL2
    # and LGPL2. There is debate regarding the legality of this licensing.
    # Marked as unfree to avoid any possible legal issues.
    license = licenses.unfree;
    platforms = platforms.linux;
  };
}
