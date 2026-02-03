class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.10/gw-macos-arm64"
      sha256 "54004f5b57690c0c21b935abefa95f1f2cfa77aefeb3fceda267777e9706f7b5"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.10/gw-macos-x64"
      sha256 "ba6a99513441a73d2dc68f6d8cb3aecc4b0aa7357fa11a16b2d63ba5c2889dd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.10/gw-linux-arm64"
      sha256 "9b0b5fca462b957c98e0a0b253c45da2c4e22633f9e97ceb80e5dba19c23e86b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.10/gw-linux-x64"
      sha256 "216c12a70646669d068ce76dbb729b10973bf354d63d1cac363b275b7e3614ac"
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
