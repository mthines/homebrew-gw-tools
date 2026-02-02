class GwATBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.2-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.2-beta.1/gw-macos-arm64"
      sha256 "3fe9ff58b96155a9e12e504c8b81cc23fda763348924b25a171b0871a78464d4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.2-beta.1/gw-macos-x64"
      sha256 "1401b42184d4af167df46f78afa80f44459596c6f0b90a01ba1abc0a956e3352"
    end
  end

  def install
    bin.install "gw-macos-arm64" => "gw" if Hardware::CPU.arm?
    bin.install "gw-macos-x64" => "gw" if Hardware::CPU.intel?
  end

  test do
    assert_match "gw version", shell_output("#{bin}/gw --version")
  end
end
