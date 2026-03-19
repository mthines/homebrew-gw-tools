class GwBetaAT0450Beta392 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.45.0-beta.39.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0-beta.39.2/gw-macos-arm64"
      sha256 "20ade25ae3d21c386a1ed25a0cf43f0df8fd0e6d1de73d47f9ce9cbe1ca91d71"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0-beta.39.2/gw-macos-x64"
      sha256 "39d769df8732398383c6dce88c542f1b03391817b5e07cb6e34d8a0acb788781"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0-beta.39.2/gw-linux-arm64"
      sha256 "5ac6963b3d0cfcf56a461ed82350c62dba60835007634ae4e5e9b2e71b75e7d1"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.45.0-beta.39.2/gw-linux-x64"
      sha256 "977e05e9ff8a8831264bc5d16587d04b020f9311b02d1f914c53e752c294960a"
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
