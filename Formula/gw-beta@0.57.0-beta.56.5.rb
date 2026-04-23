class GwBetaAT0570Beta565 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.57.0-beta.56.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.5/gw-macos-arm64"
      sha256 "b72cf5edd387a054dde394ff62792b05b9850d03d4e84896ca815269dfbb01ad"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.5/gw-macos-x64"
      sha256 "9447965f533089c0772f819e10fa445f31a486ae988dff79b47c1f7d6fefa878"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.5/gw-linux-arm64"
      sha256 "70b716fe7d7cfdc0ea4e32e11d8a74cb2c04cd0743b770c1bc10f99771ebfca7"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.5/gw-linux-x64"
      sha256 "99b3d1dde9809c1dc189ee9c14f02fc9648ab47be6310487e93c91d47d6b16d0"
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
