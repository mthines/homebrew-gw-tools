class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.55.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.1/gw-macos-arm64"
      sha256 "0b3db39e901f1855946eb0bc9d9f0e1d3bf7c1dc243b28afc7f9bdff128a3d66"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.1/gw-macos-x64"
      sha256 "c94fc835e7d816626df0cf8e747f8525cfad2deba52b85405cf5ea7244126af3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.1/gw-linux-arm64"
      sha256 "322808e0dbb95f694baf4f0e2e1512c68576f3761b89356298c2d8d726869b90"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.1/gw-linux-x64"
      sha256 "74fddb1fe7d39b154f294d5b26c3a17a1ee62e5bab11959ca7643aa6abcf8ec0"
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
