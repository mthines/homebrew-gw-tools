class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.0/gw-macos-arm64"
      sha256 "719587e1fe79633f60d7de7ff16959ea381981579361eff78cb6f6ffba1e69d8"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.0/gw-macos-x64"
      sha256 "2d49c6d176f52d9d35170586f86c0fe985069ebea8e7de0c4b1b342ffb948cbd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.0/gw-linux-arm64"
      sha256 "524e6570a712631dc6e2980bf1bbb5e8cc7457d2c1c708f4c2d63e1485856fa1"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.0/gw-linux-x64"
      sha256 "ed6d6ce206eb81926e18ddf17446aef41500c08d80120a1fa92acc296856aa19"
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
