class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.70.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.1/gw-macos-arm64"
      sha256 "6955d8332307585dc540c14abf2f2cbb8c88784dba77d6d6a9da7eefd698029d"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.1/gw-macos-x64"
      sha256 "8b968e5d6dbd4daa01fe0df629320bbd51e3031a8e3e7a16bbedf33c423f1a11"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.1/gw-linux-arm64"
      sha256 "ac9902cbbb55566868e7ff89371760fdc8a4949ef4dc31f3d71bc83d42bc932c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.70.1/gw-linux-x64"
      sha256 "5532847bf4bebb4061ce7f1dce3cbc7365598ac8b2c797892b31433424383a52"
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
