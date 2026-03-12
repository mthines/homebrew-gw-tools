class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.35.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.35.0/gw-macos-arm64"
      sha256 "ab707ddd82df74e08e9179f23889b93ae5fad0c86b3386bfe5c39a016c8a4526"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.35.0/gw-macos-x64"
      sha256 "4b898f7b46415a4b169e2753078791bde491b6e379e34222871aee71e058c334"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.35.0/gw-linux-arm64"
      sha256 "ab4c73582446ef71aa39a123b9516e8339f4def76122e42989c8cab239a6fbbc"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.35.0/gw-linux-x64"
      sha256 "42a702924069f029b17d07863118aa00fff74e1247dbfc87cfd1e91397644069"
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
