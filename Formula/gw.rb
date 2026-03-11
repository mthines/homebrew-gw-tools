class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.32.0/gw-macos-arm64"
      sha256 "54884ac2d28b0635ffc780514974710fa83f64418bf6960e6e356272a5250eb8"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.32.0/gw-macos-x64"
      sha256 "e7372b77d01e3b9df2702596b5ec1fb08aa3c9baeb39c331cfa7dd1a2515426e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.32.0/gw-linux-arm64"
      sha256 "c7b78a07245778dd353f7118ec48d72c4bef07a20b38c3a35cef618be947197e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.32.0/gw-linux-x64"
      sha256 "45762006d09fa4437d0af3c14c74139aaae5c3212c984f53d7ad1b8556014de9"
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
