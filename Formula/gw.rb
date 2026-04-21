class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.56.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.6/gw-macos-arm64"
      sha256 "bebd11ea49a4d24deef943e468b9f5104d130ac9a4df86bf22be2f365657070d"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.6/gw-macos-x64"
      sha256 "69dc66175cfc2d2de1a9ea0fde255e14e3dff8b4b0ad46c7796b43c2cecc09c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.6/gw-linux-arm64"
      sha256 "310d065eb13408e207423676fd43697f5574d6123920c679481b342cc276d3c1"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.6/gw-linux-x64"
      sha256 "9bdb41c6c6fd01375ed06a70cbfc1b3678cf0d5b3013734eaa23e84bb1d51142"
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
