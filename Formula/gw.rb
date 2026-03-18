class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.44.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.44.0/gw-macos-arm64"
      sha256 "8e3b0777eb126d96fb8e1d0ce0a2a4fe1b763830b84a271a4d9f8f871a008ff4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.44.0/gw-macos-x64"
      sha256 "a96e603705f0c915ab6c38889e896cc93f29c5ee6ddaeae57b056e5876cae5bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.44.0/gw-linux-arm64"
      sha256 "a2091d9b1d7a92f0624f5e1375d7e2411cf54a678a25ca6f90eee193725c649b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.44.0/gw-linux-x64"
      sha256 "bf0584436344e89d9b24f7cc184da36c5207576e6368f11ab880b0ed5892cca3"
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
