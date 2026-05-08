class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.60.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.60.0/gw-macos-arm64"
      sha256 "4517bcf3dd4dc10c7244ab41b57c1ecdd0127b68fd3bbe690e92c6b8c7a56e1e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.60.0/gw-macos-x64"
      sha256 "bdc7e5eb7c86cf33c627179514148c1fb6552af659e5a92b99f2967e238555de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.60.0/gw-linux-arm64"
      sha256 "2e9ab4d5e260daabda739115dc49d84cfc7310249858695d8f13302b34f91540"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.60.0/gw-linux-x64"
      sha256 "0a3e636f7970f13d291079db535bd5ee357197ecc0027b64fd2e9ab729bec04e"
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
