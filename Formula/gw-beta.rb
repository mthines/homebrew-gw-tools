class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.14.2-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.2-beta.1/gw-macos-arm64"
      sha256 "209f0ef31c05d6877954aee0b699e344cb5e46ed767f64b57d26139cdbfe9c47"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.2-beta.1/gw-macos-x64"
      sha256 "a19c58692085ea67f7936b3ab2c381a5f359e1caab1676841b09c4353940bbc7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.2-beta.1/gw-linux-arm64"
      sha256 "26a3a4020840a8771a8c4481d8c7789df005ff84dc9272d991a9a8030499f3ee"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.2-beta.1/gw-linux-x64"
      sha256 "e1c335f81b33d1d67f941ae9dc1fa1966fa53d7f5c7ddce6cddc62abb032eb37"
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
