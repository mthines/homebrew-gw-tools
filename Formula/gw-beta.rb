class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.37.0-beta.34.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.2/gw-macos-arm64"
      sha256 "2357c0811e95aa0234a94e241aa2bf6c96856f3887da3a18d24f5d7b8bf5ad1e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.2/gw-macos-x64"
      sha256 "04de0cc7842a8d1bf4a5992503c55e78e783c31c10751c8dd8948f21d6088bc3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.2/gw-linux-arm64"
      sha256 "d62c498727b9f2dcfb835d88b30e19da633955c69df9e6d38bdb4db0064e7956"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.2/gw-linux-x64"
      sha256 "7e0159c4c47b7038aee142cff6a6266154ce9cf4a702bf53697f0579f40970e8"
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
