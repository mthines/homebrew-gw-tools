class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.19.0/gw-macos-arm64"
      sha256 "f0fe9205954b843425f102ec5b96cf3c923b1c6c9da4301f18b85e8df0ce7470"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.19.0/gw-macos-x64"
      sha256 "0ada8cf708136dd711b86f1482df2eca9feaee57687d7b888aa012fab7fbce16"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.19.0/gw-linux-arm64"
      sha256 "2ebbf2eaa5bf31e23b856364db45e60ca6ce6d637c75f3df1a78108b8bb2c9ed"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.19.0/gw-linux-x64"
      sha256 "b82bf6f59933065985360d5a58bb4e5eb800598f5dddc473c9bfe5186cfc684e"
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
