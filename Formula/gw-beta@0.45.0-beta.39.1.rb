class GwBetaAT0450Beta391 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.45.0-beta.39.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0-beta.39.1/gw-macos-arm64"
      sha256 "e46eb55aeff27835333410b8fb4b4f8a6e3182510605820e0f4db3515997b3aa"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0-beta.39.1/gw-macos-x64"
      sha256 "8267d0104f910599f602a61cd7768ca28a2efed80b317a418f35723a4f27dad8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0-beta.39.1/gw-linux-arm64"
      sha256 "c9658a8445889ffef67f835719573e1b845d06d3368eb3617b36c8686082d282"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0-beta.39.1/gw-linux-x64"
      sha256 "6785f2c8dc6a6bd5ec5f8eb99ecbf0cbe1e045503b332dfb9d8d5c71138a0a83"
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
