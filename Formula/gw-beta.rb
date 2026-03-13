class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.37.0-beta.34.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.1/gw-macos-arm64"
      sha256 "825fdddbf76caf6af9b814cbd124d2d50f62a239b30dccffbbd7fbb9cc7b9759"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.1/gw-macos-x64"
      sha256 "7520ec48f07bd703e8bf1234d6bb1fc2a986fe93f7b8e6b35538bc4dc26a0c7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.1/gw-linux-arm64"
      sha256 "0d25af8b5a07f7387db24e40c7cf517dbbddb77736691ca38f529576aac48c8e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.1/gw-linux-x64"
      sha256 "15d5ae3861a61343c4c671e851be8d5b1d447fe77da6a8db3e745acabbbdfc4b"
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
