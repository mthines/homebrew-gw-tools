class GwBetaAT0661Beta791 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.66.1-beta.79.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.1-beta.79.1/gw-macos-arm64"
      sha256 "cac7aa6493437dde4c3435c51644bbd06575eb67ba41bd114895f8a6f7743021"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.1-beta.79.1/gw-macos-x64"
      sha256 "f258771e261f9f78514a418b201a7c8e82301c21341e4053a8671d8603cf55bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.1-beta.79.1/gw-linux-arm64"
      sha256 "56f065a156820e0e59d05ba80d23d9fb4130c984bf4a8f4b452a2d91b21d127c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.1-beta.79.1/gw-linux-x64"
      sha256 "b36deb9090e91589365dc21592c029a6ad988068f30e0e8c514704dd4a1d4c87"
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
