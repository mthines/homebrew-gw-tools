class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.18.0-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.18.0-beta.1/gw-macos-arm64"
      sha256 "82cee94f24373aea4f759031b903d5b013c47f5b00830eae6ea265b8f223de77"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.18.0-beta.1/gw-macos-x64"
      sha256 "aa039ee5a0f8124767747d9b16da1901916253d7c7f1dcf20608c262c6a95ab8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.18.0-beta.1/gw-linux-arm64"
      sha256 "5bd7089f083a7a5e229e66c30b93cee424aeeaf6a77c4701891ecb1e77a7c139"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.18.0-beta.1/gw-linux-x64"
      sha256 "5873cf448b842c6ed927a14e853f1a154721b180a07cb595cb6b443ecb14d3c2"
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
