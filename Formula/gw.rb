class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.0.0/gw-macos-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.0.0/gw-macos-x64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
