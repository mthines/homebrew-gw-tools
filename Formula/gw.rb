class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.4/gw-macos-arm64"
      sha256 "8940fb7d1108647c8d0d8d142eb39f5b1767ad70cc2f01f4aa257a7f7d919509"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.4/gw-macos-x64"
      sha256 "947bc4e17264988a36816f3499be31a0f96e2dd030045c611c42323611c828b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.4/gw-linux-arm64"
      sha256 "58ebe8976042df72a18cb30c28908b72969ce5a5e3b299ee61b1e42e06bd82bc"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.4/gw-linux-x64"
      sha256 "6b02cef574cd5d0f03c00239bb9fc164a8bae2f347a504919c270be413cdb262"
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
