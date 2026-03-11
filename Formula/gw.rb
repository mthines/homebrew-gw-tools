class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.32.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.32.1/gw-macos-arm64"
      sha256 "2a51b38f1334292003b91384c101101fd3e526d66d0212842807b52c9019b58f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.32.1/gw-macos-x64"
      sha256 "78546d86a5dde153d6a69f1f5ee860a466639ec9505c2f4cd36e2990cf65b404"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.32.1/gw-linux-arm64"
      sha256 "384c517426df2dd9cab12825c263e9b623b92bd1c076cfea13d4671531bd3fb9"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.32.1/gw-linux-x64"
      sha256 "4758dbee5b6946e152c9e871008f19b3705df498af3fc7ad437a87a5dfe4ce46"
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
