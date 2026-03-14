class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.38.0-beta.36.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.1/gw-macos-arm64"
      sha256 "68e0329c0f68cf5bb6efc7495241a6dd68fa4376a4156f5b27798f8fc5ccf496"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.1/gw-macos-x64"
      sha256 "cb88decfa0a5c9420a80a2082abb8d10d31243f416e97e265bbccee283ade381"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.1/gw-linux-arm64"
      sha256 "d31c8638adada7f6c10be49ec2b25f2c317dcf7e212f7337d04651e665c86487"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.36.1/gw-linux-x64"
      sha256 "a410ad131f8bf96dc33069cfbd1d275e67729b4d330fd7e7ebcfcee485362abe"
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
