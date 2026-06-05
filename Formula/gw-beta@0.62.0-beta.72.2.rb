class GwBetaAT0620Beta722 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.62.0-beta.72.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.2/gw-macos-arm64"
      sha256 "59469b55ed34eb26e337628493d8bf4ca092eb4c1af6df740aa4d59cc744200f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.2/gw-macos-x64"
      sha256 "bfaa31f4bdba784bbf81fa7b4b88ec20f975b78c6a5d68e646b599ec75593d72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.2/gw-linux-arm64"
      sha256 "e950767d1174cc6206cc7e969aed0ad0506cf021bcd81f050a17d85cd27dc750"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.2/gw-linux-x64"
      sha256 "c22ad2947a53b5a45b769eaa3eb676aa19a67db07c04294b08557ae686ad0693"
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
