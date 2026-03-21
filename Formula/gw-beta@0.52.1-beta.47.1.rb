class GwBetaAT0521Beta471 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.52.1-beta.47.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1-beta.47.1/gw-macos-arm64"
      sha256 "0e24756f5433d7519cf02f427f26178f45744c42e43991ac8421f040ae1d9c33"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1-beta.47.1/gw-macos-x64"
      sha256 "b1f666c7ce163b2a1d86b4fe11580cbbdb4c2512adb163a6924865ebd75c04b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1-beta.47.1/gw-linux-arm64"
      sha256 "01aad091fe8d165ed51944a0371a9bf499a147cd137854e6ce8c46e158f270ce"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1-beta.47.1/gw-linux-x64"
      sha256 "8f73db8215033f6113e604a62a38fb26529266847ce7b89abbb762d8674cb833"
    end
  end

  def install
    if OS.mac?
      bin.install "gw-macos-arm64" => "gw" if Hardware::CPU.arm?
      bin.install "gw-macos-x64" => "gw" if Hardware::CPU.intel?
    else
      bin.install "gw-linux-arm64" => "gw" if Hardware::CPU.arm?
      bin.install "gw-linux-x64" => "gw" if Hardware::CPU.intel?
    end
  end

  test do
    assert_match "gw version", shell_output("#{bin}/gw --version")
  end
end
