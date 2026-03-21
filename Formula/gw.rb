class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.51.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.51.0/gw-macos-arm64"
      sha256 "c0da463b40669eeb8bb1bb40588382fdb32d8c7719aa73774c683360d55155d7"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.51.0/gw-macos-x64"
      sha256 "7519c3c0b49780ddb6f59cf3f7cec11a8c6cd384eb95a56d4a1299062d8899c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.51.0/gw-linux-arm64"
      sha256 "caa430d4f417dd352de6235f15be7cf2781087c4b60b336d2f49f60e3832ba9b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.51.0/gw-linux-x64"
      sha256 "0b0ce7d601174c1c1a62810ed69409f6106b6ec9d0ea9c187059813226c4ad79"
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
