class GwBetaAT0580Beta581 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.58.0-beta.58.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0-beta.58.1/gw-macos-arm64"
      sha256 "476119b7f50b91d3c0a1edc96ee2c3e8933856ddd7dd7eec467937e469ca1174"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0-beta.58.1/gw-macos-x64"
      sha256 "04d9bbce3c0c5f2b041e8847e80505de2ce6dca4a8c2f9bdf54a56eeedc863f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0-beta.58.1/gw-linux-arm64"
      sha256 "d3fced8c293d0a78551a835e7dc5254323f66adbdddcd53ace9ff3bc2d8f7cd4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0-beta.58.1/gw-linux-x64"
      sha256 "e4bf9ec8fae39f5279ab2e1986e1268a4ac893a9f0fecfa7f3b438bd6e16cbb6"
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
