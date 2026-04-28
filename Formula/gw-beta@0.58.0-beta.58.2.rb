class GwBetaAT0580Beta582 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.58.0-beta.58.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0-beta.58.2/gw-macos-arm64"
      sha256 "672cc985c5b7922c53ba7a8bcce613c1e62945b97ff1af62121bb84cf6034281"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0-beta.58.2/gw-macos-x64"
      sha256 "8e52b7b99084e6424cbbccf67656c23c2ea2f7d8c3239594d79492ea521e96d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0-beta.58.2/gw-linux-arm64"
      sha256 "157f1508847b602318be504a8eabb23a0f5fa0209eb043f933652581b10193e6"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.0-beta.58.2/gw-linux-x64"
      sha256 "abca6e9f013b88b71c1269c0d7ef8119930e08269a5bd4888fe2d417b6daf08d"
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
