class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.56.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.2/gw-macos-arm64"
      sha256 "416c2d669ab2965f6f9bce90ab43d7bf0d09d46261c9dac0ad057b33c7dc5b8e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.2/gw-macos-x64"
      sha256 "650a94a4edb33a514bddd7e52f8e32a82ae4518eaf2392ca87982f9c5ccd4470"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.2/gw-linux-arm64"
      sha256 "e9d82d70da48908ede757fd1b0f73958baff724f73bb6796e750bf12f133f8bd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.2/gw-linux-x64"
      sha256 "953b5c10ae49eca3afb2a5bdf04b4daf2db2b496c1f26d4bd87cde94bd5bd374"
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
