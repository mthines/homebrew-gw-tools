class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.17.1-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.17.1-beta.1/gw-macos-arm64"
      sha256 "bc3d525069e4f01a3b7e5081885fbb6ac3ece1672cea90266dc028448bcc7a09"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.17.1-beta.1/gw-macos-x64"
      sha256 "d7719495d88fc7b9c8544d063c1554545aed207fe69c863facd9c0bf98777e21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.17.1-beta.1/gw-linux-arm64"
      sha256 "b8279c7faa06c10a3e7b9ae5e76ebeccdbc0a92ce7f3504f7da7de576a013ae1"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.17.1-beta.1/gw-linux-x64"
      sha256 "c1b4d7627be3db801e6ea8ba7b660a666d9d8ba57ce689afb425503ea998356e"
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
