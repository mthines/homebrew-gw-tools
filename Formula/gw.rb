class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.68.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.68.0/gw-macos-arm64"
      sha256 "17f05dee5341d79410d5be698c5f98fbd59cfe0e95bff97594d2f712bf9543c3"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.68.0/gw-macos-x64"
      sha256 "7aadfa79fd4768d0049578673063751ccc16df23467c4825e07f8e0d2930dd2b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.68.0/gw-linux-arm64"
      sha256 "b98c0e818f65b603f2b0261baf67104e608e245c0a37c461dfa856f867952734"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.68.0/gw-linux-x64"
      sha256 "9c78dddef74a68d35552aa7bcf1a4ea026df5ef063556f00431cc5d00c6b0ba1"
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
