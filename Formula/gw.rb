class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.53.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.53.0/gw-macos-arm64"
      sha256 "0fbbf131920287c91754fb5beb7dec6682e29b9c791cc7d061f6f6d51ce6d2cd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.53.0/gw-macos-x64"
      sha256 "9a9fcc462c469789a1d77c9cacd7d8212a92bc6e6d6c9a0fe71b4fb79a8b2c6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.53.0/gw-linux-arm64"
      sha256 "ffe1f1ea80c3b012c26d64d04b415cd0d7d9b0d73b734839273a28ef0ffa17da"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.53.0/gw-linux-x64"
      sha256 "2698c4393616c448ced7ca8db77d0911b63449cad93b3c5c82466315566337b4"
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
