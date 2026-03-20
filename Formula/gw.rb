class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.49.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.49.0/gw-macos-arm64"
      sha256 "faa80226e8987824394c843403aae731b61a11fc2680dfbe7b5bbec0f54d2dc3"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.49.0/gw-macos-x64"
      sha256 "c827fa3ff64b43444fccb93aa9681e7917a69e514324b78e28864a572fb54e3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.49.0/gw-linux-arm64"
      sha256 "913e352fd58034d196a105d137b50251d7804ac8241c9a065afac25b79486295"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.49.0/gw-linux-x64"
      sha256 "6b41669ad88ea7dd08f26cae114c302f3f5accf520dd234e7741ba658f3ee8ac"
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
