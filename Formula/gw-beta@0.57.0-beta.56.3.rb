class GwBetaAT0570Beta563 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.57.0-beta.56.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.3/gw-macos-arm64"
      sha256 "7ba18f746470281d2b6425217199f60f1e901a517a6262c99ae4618ed6a1939b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.3/gw-macos-x64"
      sha256 "3cbffd0920ff3cfa2a1bca6141878e1f4eeab55a79845389e4f6066f89ef13ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.3/gw-linux-arm64"
      sha256 "4a24cb926db1907e26d9ec917f46d40c7d8f4704eb838abb1dc84c8ba93ae21f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.3/gw-linux-x64"
      sha256 "a8e2640cde9b1ee5f6d6a5a9930468153faa08322dad894e3c479209cc5aed60"
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
