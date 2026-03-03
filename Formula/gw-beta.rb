class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.22.0-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.22.0-beta.1/gw-macos-arm64"
      sha256 "7c11d767520b7412756aeca3a0df61cad1b90fccd32e69edbbbaeec50b0b427c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.22.0-beta.1/gw-macos-x64"
      sha256 "984e1b23af8702f6d142530f1fcc90158d8417cdd867a5ffaa42ed3b520140d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.22.0-beta.1/gw-linux-arm64"
      sha256 "48fd5ec21a3af8c810bb32beb7f0bcaef02f250f110196b404abfb8dab221f59"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.22.0-beta.1/gw-linux-x64"
      sha256 "8efa585551ce9cfc141072046e9f5d437db44f2d790c633460a15df2b09aa213"
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
