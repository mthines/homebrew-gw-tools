class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.56.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.5/gw-macos-arm64"
      sha256 "1649cc42ce7d910432e8abd0ccf33d5b40787c3f047f34733e4e7d2ec378651b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.5/gw-macos-x64"
      sha256 "a7115b0da5d01d528dd73f249fd9531165dff3179f3e67e51fa9b1566cfacb88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.5/gw-linux-arm64"
      sha256 "59d4ebb2286e0bc9653a647521dce5a1d692557f41bdd8c7bc3518e6ebc3388a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.5/gw-linux-x64"
      sha256 "4675c3e71e667fa9d6b4ec1ac71544f9d3037dec4af957618dcfabe6da6af6bc"
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
