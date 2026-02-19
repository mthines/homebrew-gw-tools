class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.11/gw-macos-arm64"
      sha256 "b3feeb88327455d1ccabf6b21d274b0e867c943bb79c77382eb104297bfaeb7d"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.11/gw-macos-x64"
      sha256 "f332d9e3332c74ce6333987ee1544a41fdbbfeb7f29fd93096eee1e8796bea53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.11/gw-linux-arm64"
      sha256 "41dc50231bb94321c1fcb80f033402254a56a9463f33fc7f7b4a3f2910768478"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.11/gw-linux-x64"
      sha256 "421d8ee1fb12b72b55e3b4550709337c0c6e771e812df9ecc2e417e473847689"
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
