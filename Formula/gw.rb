class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.45.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0/gw-macos-arm64"
      sha256 "ee8edeb3b0854691290693f32b9170a5f6d4486e6a4cabdef11ba772b571b2d0"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0/gw-macos-x64"
      sha256 "bc72b6bc482197cdcda49c5b3f5e40b49c9f5cc088c43a34dc719ed48a9908c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0/gw-linux-arm64"
      sha256 "4942b2b3fba5748dc3810b7d507bc8439bbebb2f3f1a7c706669ba099b618540"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0/gw-linux-x64"
      sha256 "004a9c03e5e1075ef19b8b8150fc48ccdcc68feec89b17a14be8801d9fdaca81"
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
