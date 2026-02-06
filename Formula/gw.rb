class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.1/gw-macos-arm64"
      sha256 "a97f60a9a48302780dcbf3c24c614527a82e355c486de446d269766381ac71f5"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.1/gw-macos-x64"
      sha256 "df064d30aca14f9982d10f3812028e7c926886eebe73885411ea15f32e4aa2c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.1/gw-linux-arm64"
      sha256 "79939d0706a4dc6715fd031bdc2383318be2174e1ba2055f0c15334e7e6ecead"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.1/gw-linux-x64"
      sha256 "d6f52012b1cd96e284b2146ab56fcceb5f5f197b1ec55023be25c744bcd3da7f"
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
