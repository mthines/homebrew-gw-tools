class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.40.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.40.0/gw-macos-arm64"
      sha256 "42681aec3928a722fca697400ca5cd79622ca9b3927390bc2bcceeb07b90de94"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.40.0/gw-macos-x64"
      sha256 "c3bd3fc48b1bc13eba282b60faeec3d46794a7c0b28943121a3ebded7a93f782"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.40.0/gw-linux-arm64"
      sha256 "efa4ea8440a7b916c09e0a33f6f93c33bbdb68fd3999f0ccdbf90508d346f4d8"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.40.0/gw-linux-x64"
      sha256 "d99fe32bf66454312a107b15c1ff8d69416e75c88ef0ea00183d60ccd3015f04"
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
