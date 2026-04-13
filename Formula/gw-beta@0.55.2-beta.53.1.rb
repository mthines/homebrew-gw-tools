class GwBetaAT0552Beta531 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.55.2-beta.53.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.2-beta.53.1/gw-macos-arm64"
      sha256 "fc898707711792d791779658c12d30e84414e35bed9bd60dc4b361270c4a1b87"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.2-beta.53.1/gw-macos-x64"
      sha256 "4c45a637e6ef4b5c4ba9f83f5f83bbaa8d601e69987cf436e2013a165ad0c41f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.2-beta.53.1/gw-linux-arm64"
      sha256 "e20857d9d14c57b76285e7d51d8a763d0a115caa3e993eab5f2ed692cc91b44e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.2-beta.53.1/gw-linux-x64"
      sha256 "3128c66a19df2ea873438e5526a6abe855466fd6a2a234aa79f31254c5c92890"
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
