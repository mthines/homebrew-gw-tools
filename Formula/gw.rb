class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.30.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.3/gw-macos-arm64"
      sha256 "11e9185dc87fcf00ec004f50f1e41dd4203d2d574fc84759fac5ea5722e3cc06"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.3/gw-macos-x64"
      sha256 "a4f7fec1bfcc4336e702d3fcb6c6e5fc25b883bb0d80955389cd6869087bd398"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.3/gw-linux-arm64"
      sha256 "fd8f40c0c26fb922cc3bf4a85359f4f7fa767094c3ef546a86059a424b7410b3"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.3/gw-linux-x64"
      sha256 "61cc338f07d892ccd5032797efca48a4281839442f10232690997ed0b774b010"
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
