class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.11/gw-macos-arm64"
      sha256 "ef9d2b19c98e4fc0a31b021731b396b744de15e615774f191ee0770da79f17ab"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.11/gw-macos-x64"
      sha256 "c173a029ee4e3c3239b6245295c655d295e63c03fb26936015c1acab2ad513b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.11/gw-linux-arm64"
      sha256 "3ebcd27b4677a8dfe49313adf5e8cbda17c2b0c47ef7e081646f261c3fb884a8"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.11/gw-linux-x64"
      sha256 "eaa4964a7efa620797cb39ce3a5e20d9f2b8e924c7fc659c064cc8811f04dcba"
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
