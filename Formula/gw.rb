class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.15/gw-macos-arm64"
      sha256 "e09b07f43392471112a467dc5206573eaf6cd67affdc6fee8d03fb53529de16a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.15/gw-macos-x64"
      sha256 "16f0c6605f610c991c9f299d5d2b580c3c118a19d726cdfcd887a3505222b077"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.15/gw-linux-arm64"
      sha256 "a0ca7973494257d14b731d04ca5e8d7dae794d896166d007df388cebc29a6c6f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.15/gw-linux-x64"
      sha256 "7b01a397498dc0d90645b60583da8f0b549a4b5c16d21f4fc0b18cfbbc0197dc"
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
