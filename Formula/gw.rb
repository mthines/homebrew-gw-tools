class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.59.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0/gw-macos-arm64"
      sha256 "50a390e94708e15f33ef1741c488bcb39245d04ac9faf6db82d7219f18f3ff80"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0/gw-macos-x64"
      sha256 "e6ac62154406733537b91e77c095e360521f7822a09648f1c6f7b348110bf0e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0/gw-linux-arm64"
      sha256 "9f0006443892433a64991100d556be082ec902d5bfc9266ac50c7a48970c3d08"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0/gw-linux-x64"
      sha256 "59940ac1ae79b7ca77160c47a821adba451dc01787c4b162148ea63748760ccc"
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
