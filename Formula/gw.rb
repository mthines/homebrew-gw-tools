class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.13/gw-macos-arm64"
      sha256 "907383cdd025e2ee196598f71c2e9e514de0ad47fb872bc5355c9ca9c51a1ca7"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.13/gw-macos-x64"
      sha256 "44a8ccb5f604632258387035a354e8eb92b5f59fbb4496db3fba90a7ed8aa51b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.13/gw-linux-arm64"
      sha256 "7776b2f7dcfc1426033db95ed0283744e25fe6579d0ca86f91932cea2d676721"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.13/gw-linux-x64"
      sha256 "c3f5ee52b28317c3b05ead31ea7a019abdfdce2fee68b0802a9b009aab7178b7"
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
