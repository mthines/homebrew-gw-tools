class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.52.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.5/gw-macos-arm64"
      sha256 "079aafde1ce0d05dfb672c2b2301a1b924278b91dc82274a158f68564eff18ec"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.5/gw-macos-x64"
      sha256 "6239f5c8ebcf7e1299d101fe304c2359d6bbdbbd68473dcd0894a5678cf8378a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.5/gw-linux-arm64"
      sha256 "a79128b36d35e390e508aab1cb8033722f952f9cec966519297e4c4e68889794"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.5/gw-linux-x64"
      sha256 "f21196d5ea1d7864b291fd46cec71847a98bc726261af633821a5c026f8d93d7"
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
