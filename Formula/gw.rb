class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.56.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.4/gw-macos-arm64"
      sha256 "bc8ef17093d0951d4145c44cbb45373af17a112ee641f2d68ee3f5d4601f2315"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.4/gw-macos-x64"
      sha256 "fcf0ad4d4512de788429e967c884d0992b3fd1d76f26d5bccf56b9bb05003c35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.4/gw-linux-arm64"
      sha256 "cdc92afc59dc8e7f30851b5b643d210c16355c39d5018e0675843d5b2333fdf7"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.4/gw-linux-x64"
      sha256 "40b51862ebc52e1f68bef281fde4568b95e3d5799dad0d75fa9b176e324061ed"
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
