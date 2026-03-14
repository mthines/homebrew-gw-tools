class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.38.1-beta.37.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.1-beta.37.1/gw-macos-arm64"
      sha256 "f994fc46e7c08f268f769005cbe86db8f728fcd6e18832b247e5fb4562512273"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.1-beta.37.1/gw-macos-x64"
      sha256 "5b93b6a2d40ae54f09181974c24d21309799a51cccad783b5dcd489496ef6d49"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.1-beta.37.1/gw-linux-arm64"
      sha256 "dc38fc454f5e57b47c54d3a1d609d1a2c23e6c499f924b75c71304c31af45a31"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.1-beta.37.1/gw-linux-x64"
      sha256 "02ceecf2d02affc40b397663f7dd6708ab4d4e5ed6b5bc06b606aed0db8b3ddc"
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
