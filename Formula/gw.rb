class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.61.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.0/gw-macos-arm64"
      sha256 "aa9b85cc56cd2fe5fdd358dac870b2aaeff4da14697d769531274ee694ac2378"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.0/gw-macos-x64"
      sha256 "99fb9bc6d29100d7944cc0dd2f235a2b7f1f00b5f48c82aa2230907cd42a9a83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.0/gw-linux-arm64"
      sha256 "3c8cfd9e43463fb806bcbd9257365ab9aa14ceef51b41c181293f85166194db4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.0/gw-linux-x64"
      sha256 "e1a38e5806a9c64d75a2cb3b83235570aac2ede876af547e5e3e936fc61c5716"
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
