class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.52.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.0/gw-macos-arm64"
      sha256 "7c349b000a63f4de6864f7a676c33872b62b3f0bb408f7ed5c48f1adf08a67c7"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.0/gw-macos-x64"
      sha256 "11422a0a0e5696d99c2f87f8e30279ff99ffec1f6dab950b134609ad13dbf748"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.0/gw-linux-arm64"
      sha256 "2b459a5aba40c4632539b2f437ae21b19fe2b91fa6dca66910c62bec367700d6"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.0/gw-linux-x64"
      sha256 "368cf2c09b495dc65ec7d1e3ceba47a793e5e024fb2c52059bd90f0e88573410"
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
