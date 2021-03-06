{ lib, buildDunePackage, fetchurl
, bos, fpath, rresult, ptime, mirage-crypto, x509
}:

buildDunePackage rec {
  pname = "ca-certs";
  version = "0.1.2";

  minimumOCamlVersion = "4.07";

  src = fetchurl {
    url = "https://github.com/mirage/ca-certs/releases/download/v${version}/ca-certs-v${version}.tbz";
    sha256 = "10bbqbrsqcmslz56zc5407knalh3kqypbm7lblnzzbidbapa9wpz";
  };

  useDune2 = true;

  propagatedBuildInputs = [ bos fpath rresult ptime mirage-crypto x509 ];

  # tests need access to network and systemwide ca cert chain
  doCheck = false;

  meta = with lib; {
    description = "Detect root CA certificates from the operating system";
    maintainers = [ maintainers.sternenseemann ];
    license = licenses.isc;
    homepage = "https://github.com/mirage/ca-certs";
  };
}
