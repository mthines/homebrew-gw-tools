class GwATBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.4-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.4-beta.1/gw-macos-arm64"
      sha256 "09c1dc647cd94dc9ffeab468b14e7a371f3b26407caf29f8e9b32b9697fed30d"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.4-beta.1/gw-macos-x64"
      sha256 "1d6a9641bc6f64e1a77c38d9c5b28cd145b44b80c4808f670f76c9f52b44b029"
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
