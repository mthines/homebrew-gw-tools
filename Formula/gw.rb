class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.25.0/gw-macos-arm64"
      sha256 "f5dde1a8b6adc7ac384dbca759c40192e5f658abb19c669dda95a8c907b18c5a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.25.0/gw-macos-x64"
      sha256 "ba80474081e881847cb8d6d5cfd0ba6e42ab1ae34ced766dac2e1fca488a552f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.25.0/gw-linux-arm64"
      sha256 "ce0495a916fcb85d26bab019fc356c4561f5f9f63c38a2a866426b84fc445016"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.25.0/gw-linux-x64"
      sha256 "263f17df34aad2f481c761c953f3006566c8bf3bdbef897dece2e8af9faec156"
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
