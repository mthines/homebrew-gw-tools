class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.29.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0/gw-macos-arm64"
      sha256 "00706ff19a5bef11d32c5dd3c34d2232d1a4ad892fe785f6ee7d41e09ee3e6ce"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0/gw-macos-x64"
      sha256 "a3fd35532e0f2835c3fcd27b866f9d57b08b6ea0b2ab040d6d018e1c125053c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0/gw-linux-arm64"
      sha256 "a3a6493df22d722d323278869705629699743bd39bbcffe0cecd97dc311f376f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0/gw-linux-x64"
      sha256 "9f05d7be3a9426a397a20343749cc5eb78f5307dd8015a42d65c7a4a6c3bdf0b"
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
