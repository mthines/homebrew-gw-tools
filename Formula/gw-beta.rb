class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.38.1-beta.37.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.1-beta.37.2/gw-macos-arm64"
      sha256 "1ac489e289bf7ca0cfe483f4f6b926919a0263ae7167ae8fb3ccea345dea0b3e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.1-beta.37.2/gw-macos-x64"
      sha256 "0cedb4d4b31ac1bbf012a98211845be916ec36e6a8840678589114ff6de62114"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.1-beta.37.2/gw-linux-arm64"
      sha256 "b23048d5ca221d38869e2b2ec345757d78eddd7725ca69723386ed9ca64ca650"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.1-beta.37.2/gw-linux-x64"
      sha256 "e48c10f43be8609969603bafd574b5b7c5f44ec5988bf3cacc6ef63462cff10f"
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
