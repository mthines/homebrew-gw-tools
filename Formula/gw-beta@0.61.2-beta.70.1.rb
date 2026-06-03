class GwBetaAT0612Beta701 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.61.2-beta.70.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2-beta.70.1/gw-macos-arm64"
      sha256 "d9f2ccf2c6f74d7e1f6dfd2c4b048b62c9d16cc42f43ce6509673aa44d491de5"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2-beta.70.1/gw-macos-x64"
      sha256 "2dedf0c30da58a1c63abbf329ad003249a318eac1abfc4a902f8ecd260b0b48c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2-beta.70.1/gw-linux-arm64"
      sha256 "515310c49eff4527c61315eae1eade77bf55df889a47c686108e5c6e46c19b07"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2-beta.70.1/gw-linux-x64"
      sha256 "550319062ee467607ff2368235b1a7b64e8b4c9d3bc27155dda2314c2a60b2eb"
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
