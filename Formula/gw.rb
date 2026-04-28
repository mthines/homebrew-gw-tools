class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.58.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0/gw-macos-arm64"
      sha256 "b26e5e64516c4f9dfc86d4707508f602485b1ddaee4d9b8e85f175273083dadd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0/gw-macos-x64"
      sha256 "040abc2896d44fa0c8552490fa435b267fcdae6e0ef59956c6e87b7f610ef905"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0/gw-linux-arm64"
      sha256 "f18c87139f18fc9247a4f8d26e743aaceec105858f7400288469295b68c6d3f6"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0/gw-linux-x64"
      sha256 "f1d48b3ce8c4a13335faac3d36f7ab43148c771b328328ceed72b84d13627999"
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
