class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12/gw-macos-arm64"
      sha256 "f8a4f7378b794bacc6c91cd36633c2af8afe052639ab84bdb1c903068e828093"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12/gw-macos-x64"
      sha256 "13dd5c3d66a9123c97eca6526fa23dc2c12defd93540fa0baf02f6b8af65a303"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12/gw-linux-arm64"
      sha256 "151eab6612e5b52c25726411b5c7eba1565698bce8f7420ffd96a7b84ec0cd5b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12/gw-linux-x64"
      sha256 "992cc9863d905580f7eea05f34aaa10c7027c82800c605431cfd4abb2e5122fa"
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
