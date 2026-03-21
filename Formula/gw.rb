class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.52.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.2/gw-macos-arm64"
      sha256 "fdaefac244a0541467f1ae2a9b89442cd5efc66063f60fa44ce9e587b7abec27"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.2/gw-macos-x64"
      sha256 "4b85266bc98650dc013ffd71146235c77c7d1eb06ee81a8b59f3c3a53eb21727"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.2/gw-linux-arm64"
      sha256 "fbd1e10910c5ecdac077ea2449a36c7e3ad79e680c566caff764e2514310aa7f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.2/gw-linux-x64"
      sha256 "a27ff97d0aa3e94e48a07fef1bef3eb5a35126ed6e2174758812ad6f6a13b76b"
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
