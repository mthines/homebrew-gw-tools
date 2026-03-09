class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.31.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.1/gw-macos-arm64"
      sha256 "8b4813a2507d99832b5f1eceb39bd073a41b2e523759cd39856e835c208a2305"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.1/gw-macos-x64"
      sha256 "13182686a14e4b4d56b7d160bb42bfc4ba83eede0567f8c8a327ef49cf6e139a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.1/gw-linux-arm64"
      sha256 "dc90108f65e842b9a10841cabe83bec56f9704240df1c8718300bb69a44317f8"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.1/gw-linux-x64"
      sha256 "2fa66c78ea6ecba918876f48aabc531edd2d6e0f40cea00d851f230755ff1e43"
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
