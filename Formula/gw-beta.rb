class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.38.0-beta.36.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.3/gw-macos-arm64"
      sha256 "547180f1c20b8e1c7622266b4e5c6b9fc67f73aa5058e991ae3a8578ab98b63e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.3/gw-macos-x64"
      sha256 "900725e58d15db3d3b052312605a080155a24b1074322557d53376a7ae10bb6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.3/gw-linux-arm64"
      sha256 "33ee1078508cd660159076cf0367e90a1b7b3984b4a1b18a6e7c050a9a674d7f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.3/gw-linux-x64"
      sha256 "2d735623a3251a803e12e4aaa61df5176f12c72841cfb3016fad8b7c1d8488de"
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
