class GwBetaAT0671Beta841 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.67.1-beta.84.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.67.1-beta.84.1/gw-macos-arm64"
      sha256 "0ad902291860039612e8d84a7d2758eed7a868110963e651bc16a09c833cb932"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.67.1-beta.84.1/gw-macos-x64"
      sha256 "30d641afd69b9daad3ef8e103e4debc53ca0430a18b4f202d8b3607c00b340d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.67.1-beta.84.1/gw-linux-arm64"
      sha256 "4ccee32c5640637307cb11c29b4e8647e816fc1fb7638b3ca6edf7d87bee3c5a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.67.1-beta.84.1/gw-linux-x64"
      sha256 "abf388def53aaad7e2965cfb05cf3f84c36b53a9c46bb16fc23b8daea1c470e5"
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
