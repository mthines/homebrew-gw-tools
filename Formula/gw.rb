class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.47.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.47.0/gw-macos-arm64"
      sha256 "eb24986a8ecb8e72e28a8201194265d54398bf0abf5d547ec9d3dcef608d4775"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.47.0/gw-macos-x64"
      sha256 "678fff66b7111639d1ea235b264a4db40dbdcc2c29c9d2612c86bb7ae4bebd7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.47.0/gw-linux-arm64"
      sha256 "e2ad1f2d32265ac7feb822889ee46b271e15989ce5ab419d9559d73b661d50e4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.47.0/gw-linux-x64"
      sha256 "75e0a028cbaeebaf4a18384229ffe8fc5e4ddfe6cdb2d0cf8c4d393b890e2837"
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
