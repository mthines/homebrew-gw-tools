class GwBetaAT0621Beta741 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.62.1-beta.74.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.1-beta.74.1/gw-macos-arm64"
      sha256 "fcf718ba32f67c99ea4a6c6d12607a630db02bda39a9f7ce7ce66f355a555d77"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.1-beta.74.1/gw-macos-x64"
      sha256 "b0f78f4c6909067e84a4c531a1c7aa4c1fa1e474f732cbb87a1d9a034433de86"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.1-beta.74.1/gw-linux-arm64"
      sha256 "0af9c0c970e251170258746413c895432179236a3df992b7270792dfb53bd8d1"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.1-beta.74.1/gw-linux-x64"
      sha256 "5b8fc2b9b393dd932dae96f1cc8ec70ddb088dc95e9e03815632d1202e09be5a"
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
