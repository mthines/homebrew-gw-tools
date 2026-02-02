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

  def install
    bin.install "gw-macos-arm64" => "gw" if Hardware::CPU.arm?
    bin.install "gw-macos-x64" => "gw" if Hardware::CPU.intel?
  end

  test do
    assert_match "gw version", shell_output("#{bin}/gw --version")
  end
end
