class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.7/gw-macos-arm64"
      sha256 "7bffb51b70aeab0e6689bce96278f2dda955b8846d3285a645b171b5a93937ef"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.7/gw-macos-x64"
      sha256 "aa630d436affdbc6acb236c5a9f04b5b953e776a234eed8f33dfafbb4f606852"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.7/gw-linux-arm64"
      sha256 "9d51d01f464151f7d51611c227b5f5a81f51c8a2357c4d9d04ca1b0f2c6e4255"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.7/gw-linux-x64"
      sha256 "ef1ef9127b188bca84ba0ac889b4ad2e2fbed8ca7ebcfaaea2058d7f0b40f396"
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
