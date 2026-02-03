class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.14/gw-macos-arm64"
      sha256 "a980111cafc14f96135874d682f0b9c4b5c1c1067219916a5384451a4c3980a5"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.14/gw-macos-x64"
      sha256 "a72867ce3b490dd5e2ea9724efadddd5a976d67ea76d35a74d7b8c63128205c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.14/gw-linux-arm64"
      sha256 "616a0305882d520a8d6de47968d7ccc48bcd55b498d4d2403c9805ea736e90cb"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.14/gw-linux-x64"
      sha256 "3d03e86b564a023a92f5b0fbf315655918473074154cad6d113dd7391d0fb3a5"
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
