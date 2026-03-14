class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.39.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.39.0/gw-macos-arm64"
      sha256 "0531c33ac5e3b969da35dd5d8f896b18b08a71f61f2aede6bc1dd58ea9e6352a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.39.0/gw-macos-x64"
      sha256 "bec776f636381f0665ccc111deac5a1f94e6cafffcb677dc647685d08ec6e534"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.39.0/gw-linux-arm64"
      sha256 "d00f3bafd70222ca136c20488d0e42db45492a53fc74eb3790c2831f89dd03dc"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.39.0/gw-linux-x64"
      sha256 "727c3c07fcd530abff95a8154a644f5f7922d3780f7774ac0cfdb62c8cbaeda6"
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
