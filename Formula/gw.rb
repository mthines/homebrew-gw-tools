class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.26.0/gw-macos-arm64"
      sha256 "1486635ae1c04c181428df72708d2f7ae6a05e75807e3916e1e9fc2902c442f5"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.26.0/gw-macos-x64"
      sha256 "aa771d0f44e53398672ecb6a826534ababcf50ed10f4f9ef09bdab6ad3546a8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.26.0/gw-linux-arm64"
      sha256 "0fcbd1de8ea6aa191be52d39635d9f4c8f632cab9569d4d46c15dc1a2cba77e5"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.26.0/gw-linux-x64"
      sha256 "c233c5bf38d1aa0d14c502e01b6fe1f84f110bc4dd5d055de9f5bd2246d17ac9"
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
