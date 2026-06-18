class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.64.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0/gw-macos-arm64"
      sha256 "053f8b6266a174007217e3692b58792e14cf4aebced0e99eed62bd5d1c685a2a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0/gw-macos-x64"
      sha256 "85ef5974c12d39c063879eb8a666fdc4fd0a323f6e9883a22e755701acd0566c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0/gw-linux-arm64"
      sha256 "de17cce847d68c345becef6d5adca5b2b9822b668a4306081338f73e39deb345"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0/gw-linux-x64"
      sha256 "d990668188653f10ca5e560552294b721ccf4d2ee85bbcaeaaf37d61c1a4214e"
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
