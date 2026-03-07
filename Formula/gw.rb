class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.30.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.1/gw-macos-arm64"
      sha256 "3ee88012473ea86cb86f10504facf95a88083fbb34d953b99d898c2ac46f147c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.1/gw-macos-x64"
      sha256 "ee8c1425df12dfebd3871515e43c626310c63b6faa195f5be89eeeaf687534ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.1/gw-linux-arm64"
      sha256 "16728c419341e7a705b85dde725b0c6481b218a761c80c9021f7dba661eec03b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.1/gw-linux-x64"
      sha256 "d05dc103dd9997546923d3cee1d7a8662dd8c0882ddf27bd2417646c63b39f9f"
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
