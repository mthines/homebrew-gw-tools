class GwBetaAT0590Beta641 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.59.0-beta.64.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.1/gw-macos-arm64"
      sha256 "7896450e5a08e11e47d28cad249b7e7e1595e442902f94d7fd9ba94badf0f0bd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.1/gw-macos-x64"
      sha256 "bbc58884c537deea605992c8d24232671399266ba02e708be2ab9055f0a6c21f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.1/gw-linux-arm64"
      sha256 "e6cc824f280fd2c814533ec3557cff81accc3df79b72173947954f13eceba257"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.1/gw-linux-x64"
      sha256 "c564b594e4d14b17ad3b8eddbad8985a310a976ce48ef5cac7f7dac77bcbdf87"
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
