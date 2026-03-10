class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.31.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.3/gw-macos-arm64"
      sha256 "56bffa881b0999db30a2d96a2b77daec8daa9d032b181cc044c15f82f3576a50"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.3/gw-macos-x64"
      sha256 "c7e549d96b20dbe315951456c6387123dd79351000ebdbe1f96b48d61bfe6acf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.3/gw-linux-arm64"
      sha256 "55cfbc8c3efd2d2bf84b54d163e2262e7363647b61edd88f9332bf1d866d0581"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.3/gw-linux-x64"
      sha256 "4aa61600ad803fcda54be1152eef8330844062c156708c8c3350865e43ac0469"
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
