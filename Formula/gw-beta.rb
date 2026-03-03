class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.24.0-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.24.0-beta.1/gw-macos-arm64"
      sha256 "a34ccda95d6b1b317e79f958a776f9d642cf39adfed4e95acfa153d154f61255"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.24.0-beta.1/gw-macos-x64"
      sha256 "14c0ede25d83319f04d63f81a9363bc6f8051c1a1726125ae45477e77421933f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.24.0-beta.1/gw-linux-arm64"
      sha256 "cf5546d622c4021b44b922487e9547296bde3c0e65a1d5f424bb16a1348996ff"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.24.0-beta.1/gw-linux-x64"
      sha256 "4f0fdb41fac957bea35d00b2762ff5172b9b2a18e58f75884b278e92603c3c97"
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
