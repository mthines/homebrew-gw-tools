class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.38.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0/gw-macos-arm64"
      sha256 "88aca2cab6e03005b1c70dc2de9d85118d80be5e563669e1ec12ce9d1a006fa6"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0/gw-macos-x64"
      sha256 "a99859e3ed8273445674d504d05154377fed82eaa2d0741d7b83d0319dc982c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0/gw-linux-arm64"
      sha256 "1658954d92758df23e38b8c352f578cecd93b68c24e52e397bdb8f2ef851cab2"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0/gw-linux-x64"
      sha256 "e8a4919e8d316c99c96a34ccb91cc76868f084bd61d4e9c40a74e2ceaa1f82cd"
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
