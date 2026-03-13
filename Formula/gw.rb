class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.37.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0/gw-macos-arm64"
      sha256 "5f95716d17dc07b4a3e6a590cc9bf4a47f341d8864665b500ad8b4b7446ca04a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0/gw-macos-x64"
      sha256 "b9a1919409ef005722f9309e0d11d72f8545063d131f540ec8ea07762cfac125"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0/gw-linux-arm64"
      sha256 "17e4781450d4fc52e5939d47994d5d087e370b3909f6387cff4101f762ac9219"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0/gw-linux-x64"
      sha256 "b79644fe3355d0711d8b6e91d190daeab986bcc876b37a39d9e4862acd7ea806"
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
