class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.69.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0/gw-macos-arm64"
      sha256 "9af4fa63d28a53ba140b89add5da70220466043389ac4b9da6b37a39dc814992"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0/gw-macos-x64"
      sha256 "804d21cbf3ba33efd07bb6bbb204380522fbb9850174e19787357c1bc14ec971"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0/gw-linux-arm64"
      sha256 "fcec15be4fd0a4c13a3ea200115834798ce539e3f92348ce731967067b7ed505"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0/gw-linux-x64"
      sha256 "e1a9725568680c8f75c75bae8f09357d76535c711dd2baad46e933b380c50bcf"
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
