class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.28.0/gw-macos-arm64"
      sha256 "8e34f3f226bbe94fe9ed5ca449907ac2459b3017ccc43dbff25e640888fcf19e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.28.0/gw-macos-x64"
      sha256 "19c9ac748ab72e56ff4fbc8e805e974488c51bbde3c7f4fff04e12cfdebf70d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.28.0/gw-linux-arm64"
      sha256 "8e19fce4bfb2e480ff6a7e711e45e109a55149fed94c5c9882080109e203f012"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.28.0/gw-linux-x64"
      sha256 "7a25ce4a02eb563bc1ad629fb9d55528264661d5b9f9238bdd152ca28cdace70"
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
