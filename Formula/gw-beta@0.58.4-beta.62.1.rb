class GwBetaAT0584Beta621 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.58.4-beta.62.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.4-beta.62.1/gw-macos-arm64"
      sha256 "1e128f07796bae45757df4741561801678138c83b058b4d998c74317268a0851"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.4-beta.62.1/gw-macos-x64"
      sha256 "083ac79e8bfa37ccd95476777e661bfd1daeb6efd7f9d20df1da4f8f41c51e8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.4-beta.62.1/gw-linux-arm64"
      sha256 "628099a2f4a10f72e2c2cb14a26707c6d488c740561afd39f6f99f825149a3c1"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.4-beta.62.1/gw-linux-x64"
      sha256 "6a5ca9f1e8bf876158e20f79bf73f0c7ec95df15a80c5fed727035295419244d"
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
