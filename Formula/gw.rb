class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.56.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.0/gw-macos-arm64"
      sha256 "ccde8637b90ca33f888b012daa0b0427677cd8a1f06ebcab0b2f7194e8212c4c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.0/gw-macos-x64"
      sha256 "fe58412eb8d17b3acac2e94b466a8c484abc22ad4d3c36a7a445bc763a38bdc8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.0/gw-linux-arm64"
      sha256 "41c9155df5138ee9b57d505f0a21e9f7a5e857d0e41bcf39e66ca23dca70e980"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.0/gw-linux-x64"
      sha256 "71607a0ed99be9485924fcb645c300c9977a71da818ee32f32ba8e02df2a8cd7"
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
