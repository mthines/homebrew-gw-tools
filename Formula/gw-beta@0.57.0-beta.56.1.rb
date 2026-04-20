class GwBetaAT0570Beta561 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.57.0-beta.56.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.1/gw-macos-arm64"
      sha256 "8c2b17340d94c3fbce6b789636e6a37fff2b76b722623bd13d0f7a1494a82085"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.1/gw-macos-x64"
      sha256 "f4de0564085da01056a151e9dd6caa22de1e4c3843e227bdc393f757cfb35d12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.1/gw-linux-arm64"
      sha256 "afb0df01f7333b16ab44b786e92b27cdc6005593cfa0d20be1f95c3fa84989d5"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.1/gw-linux-x64"
      sha256 "5df40afe54fef00796273c0bd799e72150f72a560a194543f417b79a060788ce"
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
