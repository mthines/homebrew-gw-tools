class GwBetaAT0640Beta753 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.64.0-beta.75.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.3/gw-macos-arm64"
      sha256 "a9adf47637307f0c6d2fefff044581f58f26780b9ca9a623b65929d4f7cd0056"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.3/gw-macos-x64"
      sha256 "53b6da844e5a58013c78026ebc9a8efff2b470456f51bb8ba264dd37a83a0ba4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.3/gw-linux-arm64"
      sha256 "b2e2575469d4a3dd9025d8bec329658ad1ac60e0d17eb942dbebfaf451432411"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.3/gw-linux-x64"
      sha256 "b56d9c437a6102ca86ec07fff2ae9e66e783473e7e32dfbce9bf00c35e1ee3ff"
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
