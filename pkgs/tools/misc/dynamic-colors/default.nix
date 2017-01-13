{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "dynamic-colors-${version}";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "tdroxler";
    repo = "dynamic-colors";
    rev = "088946d83849fa422358c61965c031d8669c2f0e";
    sha256 = "1ny86nx9qa727wxjifvnhlmral8qk6dnbpci3r7gimw4vh7w662j";
  };

  dontBuild = true;
  dontStrip = true;

  installPhase = ''
    mkdir -p \
      $out/bin \
      $out/share/colorschemes \
      $out/share/bash-completion/completions \
      $out/share/zsh/site-packages

    install -m755 bin/dynamic-colors              $out/bin/
    install -m644 completions/dynamic-colors.bash $out/share/bash-completion/completions/dynamic-colors
    install -m644 completions/dynamic-colors.zsh  $out/share/zsh/site-packages/_dynamic-colors
    install -m644 colorschemes/*               -t $out/share/colorschemes

    sed -e "s|/usr/share/dynamic-colors|$out/share|g" \
        -i $out/bin/dynamic-colors
  '';

  meta = {
    homepage = https://github.com/97-109-107/dynamic-colors;
    license = stdenv.lib.licenses.mit;
    description = "Change terminal colors on the fly";
    platforms = stdenv.lib.platforms.unix;
  };
}
