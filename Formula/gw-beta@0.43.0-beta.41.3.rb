class GwBetaAT0430Beta413 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.43.0-beta.41.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.3/gw-macos-arm64"
      sha256 "f4fff7aef7e853b03c8a949841b8e16bd2e5bafe3dfb6c3bd501561e47b93111"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.3/gw-macos-x64"
      sha256 "0bef5bb599c05207d90a61645f86fd93e3af0bfa83f1c84360c215cdae7294dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.3/gw-linux-arm64"
      sha256 "1b2c8b86c1625f62489beb1b1221a5b3ba04474692aa8b157ad319d4b0683f0b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.3/gw-linux-x64"
      sha256 "0bc5927dc5cac82c0e3873a41ddf7e45ce9ae573acc87e1c8aa847261e58351f"
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
