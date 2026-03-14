class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.38.0-beta.36.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.2/gw-macos-arm64"
      sha256 "7027e9de7de07299dce83c2a4292b702f178409ca0f8f65313e8107205022013"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.2/gw-macos-x64"
      sha256 "a4871821ad6cb77ca6ca54e05b472ace8e766cdd5c3826afc18446bcfb275b41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.2/gw-linux-arm64"
      sha256 "e0c22a2b41d6b7273a52c6c68f57dceafa7ed0d4dcbe8ca4264b691e9ebecd46"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.2/gw-linux-x64"
      sha256 "c529f0ae6fbb06a82303ea82b1ac2cff28099121c539029034a4e644c7aa3815"
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
