class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.65.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.0/gw-macos-arm64"
      sha256 "397bdb0da5866bc94e919f6ff86e109a94ec2871586b0a3339786671d59b4e17"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.0/gw-macos-x64"
      sha256 "d9c01b40654874509961aaf09e9c34789e8516dbeeddd36ad687716135751d76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.0/gw-linux-arm64"
      sha256 "c21eb9917b615380616739412cf2f503603326f1dc134f207ea3ed4ba944e8fc"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.0/gw-linux-x64"
      sha256 "041d12524d8bd94a3e60a17b46eeb313310a3fa47c3ba259c630cd895159051c"
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
