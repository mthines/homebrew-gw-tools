class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.61.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2/gw-macos-arm64"
      sha256 "4551dbb2d5bceaff9da726eac2cff383b61d60d1da6935755ac50684e046c81a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2/gw-macos-x64"
      sha256 "b78dea442253de7a203b5c60bc02af8cbe4838a6a3d1a6c1c0b59e00e247ec28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2/gw-linux-arm64"
      sha256 "f127007ce412e78e6d6eb33d43d533bb5defac8b005bded9131df8c2aa16861e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2/gw-linux-x64"
      sha256 "4ae2c8debb45d3f4c1984b51949f16f5ce5c620c3fd217fc53372d311dd3c257"
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
