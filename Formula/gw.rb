class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.0/gw-macos-arm64"
      sha256 "76d91453785af8c066054fe55d770278ac6357612a1e0de976155d28cd3fcdf3"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.0/gw-macos-x64"
      sha256 "9c163bdf06b87bdba743c5cccf06d72eaba4e6721d3e312e522614b15633b13e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.0/gw-linux-arm64"
      sha256 "7607bfb64f70bec1e8b37504f1b52593a70dcab29dadb1d907a14f2945585c6a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.0/gw-linux-x64"
      sha256 "63ce8a8d6e314d5bbdced5341612aed3a10de978b78c6aa987a633db4bb1964a"
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
