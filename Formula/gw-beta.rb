class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.70.0-beta.87.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.0-beta.87.1/gw-macos-arm64"
      sha256 "a8a92ed7b3fefc1645af1906996b615a668f5f3532018ab608d3cb2f2f7cc34d"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.0-beta.87.1/gw-macos-x64"
      sha256 "3b1dd8c078ce4a1b15c0c048c8aa64c7c608e947316f795894b9f272d07ed293"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.0-beta.87.1/gw-linux-arm64"
      sha256 "b050d6cc6af7a37ae86db7d5d9857b4d317ec7177c8f10bf159bbdbb17ce5563"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.0-beta.87.1/gw-linux-x64"
      sha256 "cf3799947d9f6ce0405926aa68bffb1195478fd9ccd7cbff78beea00188cf5a9"
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
