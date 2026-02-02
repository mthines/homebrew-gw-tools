class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.7-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.7-beta.1/gw-macos-arm64"
      sha256 "f1851800dc074aa5a968be455e5e7b82686991cbec7d6f1ed13250867e539209"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.7-beta.1/gw-macos-x64"
      sha256 "b771985d972838b35cdf168127b793e742c856999f2b73dd190ef1fed0be1129"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.7-beta.1/gw-linux-arm64"
      sha256 "135545825f712f498f81253d2a139879825405d258c4c8568931cf6a46e6208a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.7-beta.1/gw-linux-x64"
      sha256 "03cf7a46079ea9e766d2f83e6ce906ad87384d0c9f197db6e9c94f98308d99a4"
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
