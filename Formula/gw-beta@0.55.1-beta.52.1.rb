class GwBetaAT0551Beta521 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.55.1-beta.52.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.1-beta.52.1/gw-macos-arm64"
      sha256 "ab0d9f023add3e972bfba45b80ae71d573d58c66539abe695a12169e0dbb686b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.1-beta.52.1/gw-macos-x64"
      sha256 "a4b1160cb07ab1114efaf000e10b0090182d589677a9dfc244b4b1b6d20845b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.1-beta.52.1/gw-linux-arm64"
      sha256 "4f23734a0a1a49ed3dad4fbc5ae5f3b367a3b849da4b32cab8f02572952da3c6"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.1-beta.52.1/gw-linux-x64"
      sha256 "5cf6d44c3afc0ffe16e8a277bfab073c16a5058c85a9c888d87eb8ddb4daaee8"
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
