class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.67.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.67.1/gw-macos-arm64"
      sha256 "049f5512a7973dbfef121b0a03b93c844c04c847f36008db6408cee9cbce2383"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.67.1/gw-macos-x64"
      sha256 "9e640173a5f358233eaf56edd3e840b4fcd0d98335427637b2ba3180197c1e6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.67.1/gw-linux-arm64"
      sha256 "b1a5d8d22d61d9ec12d31c0570583feb62081caeb07602e42a4aa5398b37f106"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.67.1/gw-linux-x64"
      sha256 "65ec46a8ad8e18008b5cd6907ca8a2dc11c8c2e9ad364edb9f3f2bf04a110565"
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
