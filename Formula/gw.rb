class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.8/gw-macos-arm64"
      sha256 "5390afa1a9bc31d830fcfa2d92073268f2c492fe272a89f6e7afab2f6df43671"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.8/gw-macos-x64"
      sha256 "44eeefa45d6de2969df5c0be0dd0fa027a1c389886906a50ed47ddd40bb3afe4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.8/gw-linux-arm64"
      sha256 "af59c7a0ae68e0e465b1e710af00045d5e6ee6f6bf197cbd16d6527ea04c8f86"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.8/gw-linux-x64"
      sha256 "2a9c9a8b71eb2f5cc03e6210d2028e21c2a0e9cfce3008c743677e58ae39d5ec"
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
