class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.66.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.2/gw-macos-arm64"
      sha256 "6b01c654d9e9730e00e2f6d8866a899472621147cadc72d0129d1aa87c0ca6ce"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.2/gw-macos-x64"
      sha256 "5fb38d691523ac1c9b6b4836fb58925ffd5143eae685054dcbb22320f06ef159"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.2/gw-linux-arm64"
      sha256 "cf17c50da353b66dcf02ea963d4900d4c5589693383713b3dd6cd8172895f910"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.2/gw-linux-x64"
      sha256 "afccd38edb22062fc61e2563212edc2ad2b7f9300c4603856a2eb2da425aba6a"
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
