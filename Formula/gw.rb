class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.57.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0/gw-macos-arm64"
      sha256 "db1bedd956cef51cd23cccb3b0944ee8a5d3e501bb8467382804cb7ed4ba4d1a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0/gw-macos-x64"
      sha256 "ea8b7b8f484907bb4766138f989f3aa476310f1e58c76416879ac7e34a7e3f48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0/gw-linux-arm64"
      sha256 "42dbdad27156e5a8b2bcf0861d85c844a8bc72b0a292106cc13eac4898f31459"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0/gw-linux-x64"
      sha256 "b5db6be425fd54f4d39008fb44029b30f50ee54f187c332359752fd96da02f5a"
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
