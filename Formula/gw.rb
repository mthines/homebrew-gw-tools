class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.58.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.3/gw-macos-arm64"
      sha256 "244c0122b212f7b6b4a2c89163f593f9f578e62c6c8ba80cd987ccde81f92a23"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.3/gw-macos-x64"
      sha256 "46363f66384ad46b2eb8de6c35806d7dccf8e849eaab3a1c44af5428dfe8c9ca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.3/gw-linux-arm64"
      sha256 "b7c5c9f56976405d864b2009d06ddb06cfeed5058d8cfb7c7017254bf2f48cb1"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.3/gw-linux-x64"
      sha256 "e7f9d2d4e7952630838e927c6f4ac59d3b1cc57024302b4e48cf264b05126cee"
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
