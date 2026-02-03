class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.8-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.8-beta.1/gw-macos-arm64"
      sha256 "54dd1440cb9b5225eac42e10770fa3c3c300ad6f4c70499e3bf64e71e06af20a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.8-beta.1/gw-macos-x64"
      sha256 "a7f273c39e9c313cd3d1d72028804e656bd0b2eac15d97358928d2c9169b60dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.8-beta.1/gw-linux-arm64"
      sha256 "f495ac198332c2d72ac95048f9f6e280e05801358e4471e50384cf0758ae577f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.8-beta.1/gw-linux-x64"
      sha256 "6cb8abbbba241780613fd36b9348a5521979f5352a5781c9667d322373fd3eed"
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
