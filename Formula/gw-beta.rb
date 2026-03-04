class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.29.0-beta.27.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.10/gw-macos-arm64"
      sha256 "d1ed99c84e2470d5f809b4ff3668cdd8c1a96e79cb56e5ee622dc6a8715c83f4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.10/gw-macos-x64"
      sha256 "9501185991713f241b76935bc0b83b4a26c50b17d953641e17c69843bd5b02d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.10/gw-linux-arm64"
      sha256 "c6abb205bd7ab1584ec31ad6b077d4ab224ce57ece5d5c702e5775aff0ba1a12"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.10/gw-linux-x64"
      sha256 "00844274f860ef0e5fc87290d42494e100f3d9a138ca6a08e66061c06ddf37f0"
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
