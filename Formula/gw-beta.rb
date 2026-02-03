class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.17-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.17-beta.1/gw-macos-arm64"
      sha256 "82d83d95ca83f54fc39c4460298bd03557f496bc620dfd90b519d0b55c5aad1c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.17-beta.1/gw-macos-x64"
      sha256 "58c90a0c4ac85f568dec7d2ec627333e4cc1bbdc60343168cd820c08dbef55d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.17-beta.1/gw-linux-arm64"
      sha256 "0ee7a83ee79bcd31fb2700e49c984bc20a7d9d45432e0c75fcfa99a5965971fb"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.17-beta.1/gw-linux-x64"
      sha256 "c5203bc472f2b0970b5291c579624ed5d9d07a622a8cf89de05540138c156d95"
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
