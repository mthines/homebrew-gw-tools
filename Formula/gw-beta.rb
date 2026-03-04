class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.29.0-beta.27.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.9/gw-macos-arm64"
      sha256 "c976607e05e36b1f19c022a1c1b3e6e6a29b7e8069c53c14ebb7c7973a4263ee"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.9/gw-macos-x64"
      sha256 "4e133784d23f4388d479ca7db444e70505eb4e98e03a1aadaf8e82376459810e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.9/gw-linux-arm64"
      sha256 "14b95f689e6836eb76cbcbb44d7adfabaf34444d94167f098ca7659200a1e2ae"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.9/gw-linux-x64"
      sha256 "a16e809dcfc242a36857c4911e286b880dc969b469d9671c3d582ae0ce811296"
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
