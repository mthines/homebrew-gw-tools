class GwBetaAT0550Beta512 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.55.0-beta.51.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0-beta.51.2/gw-macos-arm64"
      sha256 "e1f867f4904fcc51a98d4f83ca388263459afbd57c7a6ca8d3cb747d78f89004"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0-beta.51.2/gw-macos-x64"
      sha256 "87809d08486d550f0a3ae7926c854d85634a14155580534fe733fa2d98638088"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0-beta.51.2/gw-linux-arm64"
      sha256 "b5316d66ac6a797cbfcd8a069c392f991c71b2d764f16c47b397fe88b2867a51"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0-beta.51.2/gw-linux-x64"
      sha256 "e03b0b63b7a13a93bb6df51e30f5f1190b9ebea15c60f107d2450262bdfe61f0"
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
