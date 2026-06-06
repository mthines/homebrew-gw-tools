class GwBetaAT0630Beta731 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.63.0-beta.73.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.1/gw-macos-arm64"
      sha256 "b5becbdf5fe07a91b9e0687ba32efafa16db3ed8defe28808b51a467b2723013"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.1/gw-macos-x64"
      sha256 "b25df37fafde80761ce0056c41d2f437575c941db402c9852d1dcd080fa34dc6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.1/gw-linux-arm64"
      sha256 "5cea14806c2bc639a1da3196d61aa9bb96e5f570663a4156edd9749c23b34820"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.1/gw-linux-x64"
      sha256 "57b1999e0fbc9a6e677c1ce1be96cc7e3ccd3dbee55a77cf0feddd86eae72513"
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
