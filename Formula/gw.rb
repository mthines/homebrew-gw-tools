class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.66.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.0/gw-macos-arm64"
      sha256 "1e39e169df45799ff885ccf8f04b58f2becd215bbbe3ecab734fcbf07fe98ca2"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.0/gw-macos-x64"
      sha256 "b43da6710fec91e0031b59f0457c1b252396ff49dd85659c31048213d891b5ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.0/gw-linux-arm64"
      sha256 "12998b3f0f4f14aa61c2d03813f09752e2169decbd63eb872b91a9728c4325cb"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.0/gw-linux-x64"
      sha256 "1abb854bd1a43d5b038b2f90bc0d7f87f2259f3158dfb660f087f4407a411269"
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
