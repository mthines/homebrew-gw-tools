class GwBetaAT0610Beta681 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.61.0-beta.68.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.0-beta.68.1/gw-macos-arm64"
      sha256 "8097936862dc161684ac5345ecf5e377c20244a987e8a4640193793c970016db"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.0-beta.68.1/gw-macos-x64"
      sha256 "1c799379a2cb21ff3ecdd74b44a858c72cd5be0fd775ceafc57bd74f8ecfbc4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.0-beta.68.1/gw-linux-arm64"
      sha256 "3fa7c26219857a86cf01ce03c20200304b7ec30b10878eb2a161c53eb1cd7b1d"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.0-beta.68.1/gw-linux-x64"
      sha256 "844a5e4a9b86227d3fd8dc694b73914728d86c9bd3b9b03f5c3cf6a6b8874660"
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
