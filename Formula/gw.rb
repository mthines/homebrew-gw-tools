class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.12/gw-macos-arm64"
      sha256 "b1dc7d5e2f3e1c5091c9d350f62d8b2862073adcb2eea374a9887de901256fb1"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.12/gw-macos-x64"
      sha256 "d8e5108a942b30e3408711fb1c362b2a0ebecf909ea1c03b15e868d3e09f9ced"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.12/gw-linux-arm64"
      sha256 "50942249e2654f458bde0dacbc3778af1a964cb28f5636f714f49e4820beb1b2"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.12/gw-linux-x64"
      sha256 "ff1647d30de5bbf81e880ce5a6b7375444bfece4fe065cdffb1b95612100e823"
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
