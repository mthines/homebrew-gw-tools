class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.16/gw-macos-arm64"
      sha256 "316b6f9edca5dfbf86cef56bdf19c8cae094425d28739fae83f861bb3a5f23dc"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.16/gw-macos-x64"
      sha256 "b0acf63bf78e83d40c12b5ac95e801ac7106d6fa6a37cd2cd623f499f1e2768f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.16/gw-linux-arm64"
      sha256 "0ee7a83ee79bcd31fb2700e49c984bc20a7d9d45432e0c75fcfa99a5965971fb"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.16/gw-linux-x64"
      sha256 "68423a895e350bfb5771dbf864b2e5df65ef665211b9006ef6f474a0950a3dc8"
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
