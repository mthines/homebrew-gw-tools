class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.70.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.0/gw-macos-arm64"
      sha256 "5dc9ccc3e0989f176d97c68535c6a462ee3aabedd4b1bfe9d1c95de982b01c7b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.0/gw-macos-x64"
      sha256 "416b607017350a37e395b7d784abd4fcf3c853705117e62b6ebe7920c1e9fdbb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.0/gw-linux-arm64"
      sha256 "c4d28e7c5dbeb1b2f68f87e2ce55955e2c4c7dcdba0d5d5033a0cc1949d1226f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.0/gw-linux-x64"
      sha256 "21e6a7cd9e89c072b13bde035ac7c48f82e21b37f9a978d24a14303f7d1655f1"
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
