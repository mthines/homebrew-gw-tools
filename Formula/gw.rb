class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.41.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.41.0/gw-macos-arm64"
      sha256 "7322ea93e2e206ed42388ec94eb656cd548c951038fbfc394537fd25e68b52ed"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.41.0/gw-macos-x64"
      sha256 "46ef1d940c7d22ccd03d5eea6c539f31cf38b027f3b2856e5abef5abed68a154"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.41.0/gw-linux-arm64"
      sha256 "9b14e9ca21a733a119185f0da4622ea52cc5dd6661b8a34a20632bc4b04c3471"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.41.0/gw-linux-x64"
      sha256 "11c310226def1cfd84e9c15d3325b10eb1bb7cc94ca0e11e07eefebcee913f30"
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
