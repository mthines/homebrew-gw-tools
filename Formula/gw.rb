class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.14.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.4/gw-macos-arm64"
      sha256 "d178562ee8821ef1cb69424d4028473e56a57ae331454acb73f91e5d2a162aec"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.4/gw-macos-x64"
      sha256 "91e1cfed16a230276b0bb76e29284c0125442d02ea54de6ba51abf71169ca412"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.4/gw-linux-arm64"
      sha256 "3682d2931b85d2fca4a94f2da3af4b2429da3a4e16aa59a208569334f3b6f498"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.4/gw-linux-x64"
      sha256 "4914ce3bbef92844807cccd84e9e0e01392a6390f9c8ce13a4ab2ca98dc8450e"
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
