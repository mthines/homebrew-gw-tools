class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.61.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.1/gw-macos-arm64"
      sha256 "a5f43f0bb6d4e0b400b9b5c757cfdb6ac3632a1bd2d8fb40588681218dcab055"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.1/gw-macos-x64"
      sha256 "1a54165c4adf31a9ef5078169cfea5680da8fbbbdfd8024c5775db175d255136"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.1/gw-linux-arm64"
      sha256 "9abdd7350feb9721aca7bd26aded99b497a055312c2276c877a0e40707fd423a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.1/gw-linux-x64"
      sha256 "4894f370828f4fad18d352802ad544d477dd3d3d71d203b22e08039647a9a3ad"
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
