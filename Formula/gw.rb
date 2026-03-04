class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.27.0/gw-macos-arm64"
      sha256 "7412e20050c13227a945dfc3ac5e1a6aee4d1c99fd47b8a3a82b93510ceee989"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.27.0/gw-macos-x64"
      sha256 "2c1b81a6e2c0ab30152dbf3e31f25545dc409bb4807d1919c071aee774f655ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.27.0/gw-linux-arm64"
      sha256 "1a665f7062422bddb2796647875c6c0da5faa7edb8d5ca480ddbfaa6153ca3a4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.27.0/gw-linux-x64"
      sha256 "ab807c97d14f2d4e0c7fdd8d61fdafdaa374fff630fb9433bd82a39fc9c937ea"
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
