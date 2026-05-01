class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.59.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.1/gw-macos-arm64"
      sha256 "97d6ecf14ba129d812cc26b986c7cfa3048a7bfcba23acaa32dfcf23508c9e2f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.1/gw-macos-x64"
      sha256 "45de59a8d9e14f61879a45dd6d024ab23773a9824a9a1824ad42e074996e1fc6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.1/gw-linux-arm64"
      sha256 "ee4ed70a085240ded4a53470c64425636d2c175e876ad6f6112994a4fe060c5e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.1/gw-linux-x64"
      sha256 "dc55e8c285154facc4bee4133e434a4c66c4e8dac0a1be02e49e4b0a9762928b"
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
