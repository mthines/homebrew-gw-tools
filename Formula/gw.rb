class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.59.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.2/gw-macos-arm64"
      sha256 "29397112f3320d2ac2cbf5ad96132975c2a750bf4b6c9b78274a0eb68d8398db"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.2/gw-macos-x64"
      sha256 "479589f56d814bbcc30d8ab22490701a87a853174fa59450ad1b24e263c90eff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.2/gw-linux-arm64"
      sha256 "360718e006feb1b50c32e719ef9d4b25c43ba19366354e7d73b251fbb27a3c76"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.2/gw-linux-x64"
      sha256 "5d6bb713c3539f15612325141727c36c1f8fe0830da150d3b2a89149c381cdeb"
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
