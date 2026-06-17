class GwBetaAT0640Beta751 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.64.0-beta.75.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.1/gw-macos-arm64"
      sha256 "d4fae944b74f4a48f9cec91972381b81f2291e4bbf34b33fa264ce28d4700e49"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.1/gw-macos-x64"
      sha256 "52e56282d48f7df23ae2a4293ac4e286c9d89d60ec7bf2865318b272f95e9388"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.1/gw-linux-arm64"
      sha256 "874dec3780399bc780eaacf6b080d83bf1f327ce2fe18d46da3a2b0b5cf1cb4d"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.1/gw-linux-x64"
      sha256 "4efb6a966568e7f0fc481d96ab1a004c0c6839f90ab9c58d0da0b8b13139c6f0"
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
