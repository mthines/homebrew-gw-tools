class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.69.0-beta.86.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0-beta.86.1/gw-macos-arm64"
      sha256 "64e99a9fba74643fd7d02e60c16e41a6f64d9f7df898c19ec7a34c65b315ae2e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0-beta.86.1/gw-macos-x64"
      sha256 "ea0029f1d33f126d1fb95ff22ef83b8cf26eacf89a130901ffbcfdd3172d732b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0-beta.86.1/gw-linux-arm64"
      sha256 "a79b32721348b5840f4d0b8369a8f014d77e734173591af2350dadae50a3a86c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0-beta.86.1/gw-linux-x64"
      sha256 "a067478e07f1b15100c37c1d4356dcd8a1727f2a81434a4378dac03f5e18ad64"
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
