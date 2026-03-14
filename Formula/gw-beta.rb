class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.38.0-beta.36.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.4/gw-macos-arm64"
      sha256 "1c5d577012177f00c82fa7030e8e516a772bb518b29a57481700441967364268"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.4/gw-macos-x64"
      sha256 "4e5823f53c418a9883d15eae5c433e0668520a6bd1aff99d5ef371f3b8e71e70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.4/gw-linux-arm64"
      sha256 "00cac563c6ffc920c15e14819ef8b33206301907cecdbd61af0596b8c0f0182f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.4/gw-linux-x64"
      sha256 "3685e20da2246886ff2df3a1d31d62c91f15ff4e402e23f16ed6c6e1ae0351fd"
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
