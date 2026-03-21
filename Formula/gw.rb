class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.52.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1/gw-macos-arm64"
      sha256 "f047368edb6cbf2e01d8c2d670bf46eeac920cef56b251b1cdcf87a808ded3fd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1/gw-macos-x64"
      sha256 "f9a6b187ae24e7b0dbf4b0fc79ac5c424649b9d017a73c6f7f7930d4e782544b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1/gw-linux-arm64"
      sha256 "2008af5662a70366587d871ae0cadbe8b3f12635f5ee110cc27ec042c1de9241"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1/gw-linux-x64"
      sha256 "fe44ae725b7d88392b1c396a2e9984144452daeceb234fd5814fdc604d730e61"
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
