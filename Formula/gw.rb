class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.48.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.48.0/gw-macos-arm64"
      sha256 "a4d96fadbc4f2eee9e0e038b2858ed01361182ed3fa02d5057ed5c40251c8099"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.48.0/gw-macos-x64"
      sha256 "15239e2b598546b5548f0de1529a3652b535adaa6d925f3e859dfacf519c7be1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.48.0/gw-linux-arm64"
      sha256 "8f452cb50c6ddf3beac7ab67c16790ef3004ae30fbfcfff7c00ce56de102f14a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.48.0/gw-linux-x64"
      sha256 "8291b8dab444578c1458eed7663e131b8dc56aac25cc375af3ef776fd8fd2ecd"
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
