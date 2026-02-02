class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.6-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.6-beta.1/gw-macos-arm64"
      sha256 "b371909f8412771c201c13919dc8ebb9536f5d30a7dc82f0d0d2d1870210704c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.6-beta.1/gw-macos-x64"
      sha256 "efdfc2263347deb88cfa4a67154d12397fe6d567afc003510d8c302a05d4ee67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.4-beta.1/gw-linux-arm64"
      sha256 "e071785e601aaee614385ddbb2d2590d8512d6aec9f6e4c74142db12b14a485f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.4-beta.1/gw-linux-x64"
      sha256 "c2600e7900afe9bb4d1f67b46f1ec65f2f133e5df39a6de6a568f76c497b2921"
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
