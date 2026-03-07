class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.29.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.1/gw-macos-arm64"
      sha256 "d711812c8b175242bee4a2ac0ef0a9a9bac23a558e1993d4ab33d28b53ba8f03"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.1/gw-macos-x64"
      sha256 "d76629f05f43f77edf61be515169b07e79a333cfda887e1ae8ce27fe1bd5ad15"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.1/gw-linux-arm64"
      sha256 "f615707412a179f6a107e78ee7a4173ccdeeaeac87595c5de5c5d5a2c0ff58a2"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.1/gw-linux-x64"
      sha256 "91a1cb8276fd67e547cc7d700553cc11c165e1a21eeebb3240b8b95bee752226"
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
