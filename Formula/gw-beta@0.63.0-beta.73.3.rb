class GwBetaAT0630Beta733 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.63.0-beta.73.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.3/gw-macos-arm64"
      sha256 "f88500b6b2379e559d121d4b769db1e88b9d1fa0f86bc5d9314100fa7d5791cf"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.3/gw-macos-x64"
      sha256 "77f55089f30a4d01fe73b482eeb65090148fd3b88f5080780fcf0145f74e55ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.3/gw-linux-arm64"
      sha256 "f5817b2bf0c2798ebb80f53c09d4db44e1331c46e569f7cc326814079916b08c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.3/gw-linux-x64"
      sha256 "7fe727126819aab75eec81a356e742b1fe4ab0ee1518490470cbc12f2fc9f5cb"
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
