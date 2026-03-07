class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.30.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.2/gw-macos-arm64"
      sha256 "81e845e78824d00d23019cc4d736f75edd0a1e89798aa922e626e455f9075b33"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.2/gw-macos-x64"
      sha256 "a25aaa3b7a18dbb792c537b14b0c36a3945863bc8b75489b1d8820e3a2f25c12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.2/gw-linux-arm64"
      sha256 "7940757e40d0a0e715b0493a324aa3c46e048422cdabf55d0fa45e1713a05ae6"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.30.2/gw-linux-x64"
      sha256 "5e70afa35012e647a63a5f6a7ef853f605187eb354feeebf94e48ecad27e88d8"
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
