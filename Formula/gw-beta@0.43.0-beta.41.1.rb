class GwBetaAT0430beta411 < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.43.0-beta.41.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.1/gw-macos-arm64"
      sha256 "adfa612e5c89faf557638eebada87a2d8836af57b4f4a44ac6762908c2dc1831"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.1/gw-macos-x64"
      sha256 "c7abd706d32a475e8ef9bd6d04f3d7a7b91e911cf40b5e4158d63cb2334d77d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.1/gw-linux-arm64"
      sha256 "61aa5847f9f04fb6042f4d4d88212e9e9ce65d9f4669ec295f375e461516c2eb"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.41.1/gw-linux-x64"
      sha256 "af65ec5ef6f96c6b7822425b7653c9ce796369aa69d83fe9760fdb3a7d710dde"
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
