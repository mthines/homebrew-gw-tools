class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.9-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.9-beta.1/gw-macos-arm64"
      sha256 "e70e0cf62c81436b5bf23eaf09e86a667434d6b1e487c6f2610aefa5b3843ea1"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.9-beta.1/gw-macos-x64"
      sha256 "d1ef7959faf1daaaaff368be5efcabed89d144f7136d8bc24976513a58de91ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.9-beta.1/gw-linux-arm64"
      sha256 "bd4e1ea94c7058ab9e3caf7f6f3537d8d789e380c1f41c1905091246d2bda762"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.9-beta.1/gw-linux-x64"
      sha256 "f6852caa6a78cf0f5405906c8972a1223e70b4dfe95ce7e36a0c3baaf36659d4"
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
