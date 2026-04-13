class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.55.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0/gw-macos-arm64"
      sha256 "e218c5ed8abe812bd1f30739cd68d2a0ecbee4670056353348fbe55b4e115d87"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0/gw-macos-x64"
      sha256 "fc7f3a464852fe58562ac418dbf445fd73c5ddd280c465b17d0ce97dcf470223"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0/gw-linux-arm64"
      sha256 "4eb47d22a8be13d301d417068fa066cc00c191bc6efbb68807a03c5808041bc4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0/gw-linux-x64"
      sha256 "f049e2a601f65058747add8305b230b7f865206dc2fba411781816a01efa6aa5"
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
