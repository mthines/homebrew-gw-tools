class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.58.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.1/gw-macos-arm64"
      sha256 "2a954a7d01a8d5e7ad6e217541ebcdf454d95122985f53b508f2744494c50303"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.1/gw-macos-x64"
      sha256 "bc96584e00b021aa6036851d3d946fb08d49adb103057c8afd46e4ab7347633d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.1/gw-linux-arm64"
      sha256 "655f3edf50e5193fd8efce83298e9178bf08796b40ae92cd4a86c17fafedee21"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.1/gw-linux-x64"
      sha256 "df938f86388d1f5887b91aa68968fd739e4c9ade7b34e59da84767e04cb4d9cc"
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
