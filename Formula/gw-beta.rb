class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.16.1-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.16.1-beta.1/gw-macos-arm64"
      sha256 "f85cc6a9f7f2fa5b1bb7a33c7add3d2c6d3faf301815599a060205b5ddac788b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.16.1-beta.1/gw-macos-x64"
      sha256 "354d1dcd5d9418d3247e3fb437a6df07bdb4bca4ba9e7a87ddcd4193179228a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.16.1-beta.1/gw-linux-arm64"
      sha256 "687890af6f763bb30328b03c2ba700ee1f456d71898cca59c22824dfb5293537"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.16.1-beta.1/gw-linux-x64"
      sha256 "989f747be4f41097636c329c0cc11b9fad645efc2161f110a12b49dbdc370218"
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
