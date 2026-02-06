class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.17.0-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.17.0-beta.1/gw-macos-arm64"
      sha256 "620daaa14465211cce6c0c32d202309860fef59e54218ed22e98ef82d5beaf10"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.17.0-beta.1/gw-macos-x64"
      sha256 "35c196cab89d67252e8e8161784c088eea73d8e45b9ada5b8bbd4835b7670325"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.17.0-beta.1/gw-linux-arm64"
      sha256 "ba22b68852382e96dbd2cb922175ea582360873e5e9f3a0ba71b92bae0fcf3ce"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.17.0-beta.1/gw-linux-x64"
      sha256 "2ece49bc949779657bba1e7b10c30162b1e7d6d9396151d98a7419cf7239fea8"
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
