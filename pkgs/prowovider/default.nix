{ lib, stdenv, rustPlatform, fetchFromGitLab, SystemConfiguration }:

rustPlatform.buildRustPackage {
  pname = "prowovider";
  version = "6a5b1b69b5cd37e831feab3b56928afbfaa433de";

  src = fetchFromGitLab {
    owner = "elise";
    repo = "PrOWOvider";
    rev = "6a5b1b69b5cd37e831feab3b56928afbfaa433de";
    hash = "sha256-deZ9pPd1Uot1E1TD0rnENXQSfL0v4w+u+8PxKB/WxR0=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;

    outputHashes = {
      "jsonwebkey-0.3.5" = "sha256-KqFnXyhuHZLLx6gExbP2O3RjaoYIOYsCb5QKodv8eIA=";
      "openid-provider-0.3.0" = "sha256-QWrQESKB+6CJoiu+ddYQTtCbi11c/7UBeG8SCT3sS9Q=";
    };
  };

  nativeBuildInputs = [ ];
  buildInputs = lib.optionals stdenv.isDarwin [ SystemConfiguration ];

  # needs an actual setup
  doCheck = false;

  meta = with lib; {
    description = "";
    homepage = "";
    license = licenses.asl20;
  };
}
