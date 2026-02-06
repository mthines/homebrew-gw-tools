class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.3/gw-macos-arm64"
      sha256 "7343568931b8c7f87f0d109771a1f28f9d0801fd251759189736f182a2bb46ad"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.3/gw-macos-x64"
      sha256 "2abdb432643051a2b4a876d9663eafa656402ed511de91dbe6aaf5d0059a0af2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.3/gw-linux-arm64"
      sha256 "6617cc1158e3ba76a295e17bc567f3ef9f36ba4cc7bb4d0d6e4552822cec38c5"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.3/gw-linux-x64"
      sha256 "9c9cf8c35b9eb453000c18ec57629bebfd38a91414ce607f912769148d1c57e7"
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
