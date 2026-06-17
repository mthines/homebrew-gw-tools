class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.63.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0/gw-macos-arm64"
      sha256 "146292e570777c3d7176dd24c0e21ab94180e3ce80999512d5316932881a52b0"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0/gw-macos-x64"
      sha256 "3f7cec4700f6467b64cd4c0186fc37cd2834de6ee50974b11ebab591259ee6ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0/gw-linux-arm64"
      sha256 "6c3d878540e1ef6f994f138065e805b487dbd78c0febbe6425401c16b5b51199"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0/gw-linux-x64"
      sha256 "4fac1a8fcc4875034403fe086b1225ff2ea1965fdc33dd23ab7620a7962c0f96"
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
