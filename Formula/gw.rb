class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.50.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.50.0/gw-macos-arm64"
      sha256 "d388d4e9b0ea27e13bba7d1c6c18408fa5ff63ff124b685cab06cdb4f8948c7e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.50.0/gw-macos-x64"
      sha256 "4311045ac447ceb5b72086777d73bcfa1f63eb30de4aa99ba29d8d2f03b249f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.50.0/gw-linux-arm64"
      sha256 "26af313230b44d1352c5b4cc787641481f7c773db5de9dce3cb8b98d2d4b7670"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.50.0/gw-linux-x64"
      sha256 "ad66bbfa581b470fc53db4014565b333b6aebb7935ab33631aecf0d69ff63ff0"
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
