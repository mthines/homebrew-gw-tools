class GwBetaAT0650Beta761 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.65.0-beta.76.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.0-beta.76.1/gw-macos-arm64"
      sha256 "6c5340d2727216f7dc84014ae1814bf1fe5dfb221a32e8ffa55829ac6655729a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.0-beta.76.1/gw-macos-x64"
      sha256 "31b358389bff1edf460d35f747325408a0e9b1b92bfbec1008a09f268e0cb2ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.0-beta.76.1/gw-linux-arm64"
      sha256 "1f771f9f1c03b16962959678ccb6b4378874147bf8d0fa10b99bdfccfdb3795c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.0-beta.76.1/gw-linux-x64"
      sha256 "7c365599772e83a8d2efc8f0ccb8dfc59ec7d6800484f0bca1de73a821527ac4"
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
