class GwBetaAT0460Beta391 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.46.0-beta.39.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.46.0-beta.39.1/gw-macos-arm64"
      sha256 "b3ba5d3870a1280aea49c81c5b264049c24ecc5a52537d5a3d3ae1cc2ac6bc74"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.46.0-beta.39.1/gw-macos-x64"
      sha256 "341a4f5307bcc6d869697bafcbc79b5040e026d8ad10263f48900d84c64d0761"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.46.0-beta.39.1/gw-linux-arm64"
      sha256 "06e0708e7afe9eb467d54ac4d8260f8761254fb32db78d5ecb168eabdbf4b0fe"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.46.0-beta.39.1/gw-linux-x64"
      sha256 "6893bbf358b2349b47b512dc62583de238532eaf7a12ddc93c492adfe98b9ed9"
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
