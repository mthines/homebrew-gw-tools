class GwBetaAT0530Beta481 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.53.0-beta.48.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.53.0-beta.48.1/gw-macos-arm64"
      sha256 "bdacc13ec5e61e9a1fb89bb284ebaede6b790c5198e0225543aff2c24e559691"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.53.0-beta.48.1/gw-macos-x64"
      sha256 "87241f62826ce545ed567a2fd96964654e19d0993fe84ab96e0b58088f79bf8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.53.0-beta.48.1/gw-linux-arm64"
      sha256 "186c12dfc863e9a51f7bab5b6b2414813cc81b0815275cd770d14de4d2d58d6a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.53.0-beta.48.1/gw-linux-x64"
      sha256 "64c43397e9ff59cbd5f9718184d019b4d0e6424f12abac0ed943a91667d09549"
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
