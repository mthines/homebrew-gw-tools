class GwBetaAT0620Beta723 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.62.0-beta.72.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.3/gw-macos-arm64"
      sha256 "3ba4938486d4ae65ae7acd6fce5024e9eb60318796afffad518540799b08d41d"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.3/gw-macos-x64"
      sha256 "5f179c9c168818c6689daefe0ac46f0ab0d1fffa9a5bf129e7659c7163f364bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.3/gw-linux-arm64"
      sha256 "6ee16d9300ac961e401d01563d8a893d9acef6f9bd2fd4d322763c84ff351cc3"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.3/gw-linux-x64"
      sha256 "4f26840eb8026b3317249a1cde964e94ea2ea7db077b7d379d5be64328397c12"
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
