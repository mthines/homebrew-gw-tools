class GwATBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.3-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.3-beta.1/gw-macos-arm64"
      sha256 "677e64c62ef585e147a3030391fdd8a3a6ed60c9e8f8721c3ba05473eb8c4a65"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.3-beta.1/gw-macos-x64"
      sha256 "7b181a5f89b4f7f5a7b782fc03f1f922b95a3496d43d262a0945ce0639f924fc"
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
