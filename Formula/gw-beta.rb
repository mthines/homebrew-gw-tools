class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.12-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12-beta.1/gw-macos-arm64"
      sha256 "31ebb0a7518f4f15dd6fee63d6dc7e34654c2095782baee270757bfff510941c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12-beta.1/gw-macos-x64"
      sha256 "f026361a58ca92189e2b2ea65a6e6b0ac745a3802345f28f68fdaff6a39c3f12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12-beta.1/gw-linux-arm64"
      sha256 "7d919146f54c5b1fae6177900afdca184e110fa7dda358239dd5c23fc514a108"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.12-beta.1/gw-linux-x64"
      sha256 "ad1ab9d39e784e2323040e48c78cdb8114a2f7ec485170317e56ae2444ed0e76"
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
