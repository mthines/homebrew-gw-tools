class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.52.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.3/gw-macos-arm64"
      sha256 "dc8f21637f48201669c1a1025fa97858a0c15268cd684ccd429791604f6dbf97"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.3/gw-macos-x64"
      sha256 "38192d7f4d06e1b9827577aa79cc2e7f1ee0c2d0c222daa8f60b36b47c3d4f5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.3/gw-linux-arm64"
      sha256 "2f1fc606b3597dc8762314e75d259a3ad60030aad4e1aba69536e55639952ba5"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.3/gw-linux-x64"
      sha256 "d2446aa300bbe4c41daa3168b68f4d89ac7208347d22b958bc6e24028b5ed44e"
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
