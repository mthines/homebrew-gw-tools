class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.15.1/gw-macos-arm64"
      sha256 "4294cea63cc202f8c3e428772e65df862693e0bf5d6670e896027f71491743d7"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.15.1/gw-macos-x64"
      sha256 "8f91fd868d244482a0ad8b354513b6da044e2e9b74917da1bac2c6ba86f4f9d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.15.1/gw-linux-arm64"
      sha256 "d196bea609461fde70b2208b9661ab4be49cbc43bc8d15cb2087f1ae1aed56b8"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.15.1/gw-linux-x64"
      sha256 "3c0e4f0ce80fd609fa7057f04a31000b25d0b209e6ca2d42b10566d98c9de61c"
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
