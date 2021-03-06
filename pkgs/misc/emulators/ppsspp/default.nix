{ stdenv, fetchgit, zlib, libpng, qt4, pkgconfig
, withGamepads ? true, SDL # SDL is used for gamepad functionality
}:

assert withGamepads -> (SDL != null);

let
  version = "1.1.0";
  fstat = x: fn: "-D" + fn + "=" + (if x then "ON" else "OFF");
in
with stdenv.lib;
stdenv.mkDerivation rec{
  name = "PPSSPP-${version}";

  src = fetchgit {
    url = "https://github.com/hrydgard/ppsspp.git";
    rev = "8c8e5de89d52b8bcb968227d96cbf049d04d1241";
    fetchSubmodules = true;
    sha256 = "71dfa0be045f31969b1d6ab4f1adf6a208f9ef4834d708bc7bf6d9195efb5f80";
  };

  buildInputs = [ zlib libpng pkgconfig qt4 ]
                ++ (if withGamepads then [ SDL ] else [ ]);

  configurePhase = "cd Qt && qmake PPSSPPQt.pro";
  installPhase = "mkdir -p $out/bin && cp ppsspp $out/bin";

  meta = {
    homepage = "http://www.ppsspp.org/";
    description = "A PSP emulator, the Qt4 version";
    license = licenses.gpl2Plus;
    maintainers = [ maintainers.fuuzetsu maintainers.AndersonTorres ];
    platforms = platforms.linux ++ platforms.darwin ++ platforms.cygwin;
  };
}
