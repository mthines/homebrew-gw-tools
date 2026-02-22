class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.12-beta.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12-beta.2/gw-macos-arm64"
      sha256 "f1e5fa091eb38c144f3b3daadd47e5349fad052ce044aaa723388cb81b1a9df3"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12-beta.2/gw-macos-x64"
      sha256 "fe33c542b84bdde11f535a20f21cb9d656454fcebf6afa93c54b45e2fe974e08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12-beta.2/gw-linux-arm64"
      sha256 "9a0b886fad35aa2e33a1d51f5e99908a4049f0c8197f43d19a56ef1414b70568"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12-beta.2/gw-linux-x64"
      sha256 "e39410f1d4065cc2e9d7848e1b44f9de59b8c02191cd409e4f4ad07ee6f49629"
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
