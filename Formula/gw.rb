class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.66.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.1/gw-macos-arm64"
      sha256 "e510018a7719ba59d0f9ffea189562baf5617b27cefb35086109fc005432cfbf"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.1/gw-macos-x64"
      sha256 "31f30dd3d0d5669801e0936fcf446b5af1f92ba63c549654c8513e79ec48a5c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.1/gw-linux-arm64"
      sha256 "037a87592eaec6e21a59a5d22930d6fc79fccf1a147877cbdc324b3b3d2c703e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.1/gw-linux-x64"
      sha256 "991909d2ac6a6e412265ed35a07529ec7cbdd23de0e4a3f79f8c2ae821822111"
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
