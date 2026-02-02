class GwATBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.1-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.1-beta.1/gw-macos-arm64"
      sha256 "de83f9c468560d2d7c9d97517cc772849c380b1e20c8fbf87692778379442b79"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.1-beta.1/gw-macos-x64"
      sha256 "bab3e761c525597677ee8defa9fbf0fb4b96f5f52e7044af7cbddf5f012e20ee"
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
