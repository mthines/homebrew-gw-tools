class GwBetaAT0430Beta412 < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.43.0-beta.41.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.2/gw-macos-arm64"
      sha256 "3e03889ba84f96104f3884bd2517408b8240b02aa4a302c543ac71cb4119d018"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.2/gw-macos-x64"
      sha256 "1932ee590781df9d1c08c650106ff4b839da15da5adce5de31572f9b03beb577"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.2/gw-linux-arm64"
      sha256 "da791a9056f3af3f926c2305f1e30af50875ce1af70521abfc678af8265b6a62"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.2/gw-linux-x64"
      sha256 "dc4c71adfa6467b30fdb955d3f231078be7a94dc7e7898f6e4de6ee640af0f48"
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
