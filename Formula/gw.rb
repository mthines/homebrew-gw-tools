class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.33.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.33.0/gw-macos-arm64"
      sha256 "efe792689267c5918cb6becc6393e6fb833e4b536a290d9eb494489171110e8a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.33.0/gw-macos-x64"
      sha256 "f270f30a9c13d319b127429fe52566f04b8401814ac0ab02279dc4dbb5d33707"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.33.0/gw-linux-arm64"
      sha256 "6ed33b25a8cf4bb7771c943f10612113a5a8a7144a3f18586310f8970b25383c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.33.0/gw-linux-x64"
      sha256 "4165463185f899d20b8f911c4bb093620c216cb3f8b5616e23f9b923f2aa5438"
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
