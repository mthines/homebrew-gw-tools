class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.42.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.42.0/gw-macos-arm64"
      sha256 "b7ee33c5e49d7954ba0969fba5e13eefdce2ec3db8015cd4c6096156adaa1f25"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.42.0/gw-macos-x64"
      sha256 "02d7c86980701d7df4008d25463df1eb506f28eba4512c219dcd457ce2857d07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.42.0/gw-linux-arm64"
      sha256 "bd740085161541889ac75fbc7b98fca1ea02eeb925d05e3fad4fd60cf8e5c668"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.42.0/gw-linux-x64"
      sha256 "ac6eb29fc71e2dac09524fd3cbf1e5d542663f06f992dffcfd13b2022951d8f5"
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
