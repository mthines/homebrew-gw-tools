class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.31.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.2/gw-macos-arm64"
      sha256 "127d825d535def22211b779ed37af4693160df86b1e7aae4664764baf5c4b1dd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.2/gw-macos-x64"
      sha256 "c4916e9e1db1820af0fc7fce54c0dcf859683ce91772c8252e0984a89c632390"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.2/gw-linux-arm64"
      sha256 "c3a7939a0c1be5de25c9e46187a9f8444494db76263d1831ae4e2dd771e9d2a4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.2/gw-linux-x64"
      sha256 "4ebd14590337b548a78806247c251c80c663387087f2b668be5e5e62e6feee9a"
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
