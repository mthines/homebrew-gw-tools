class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.62.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0/gw-macos-arm64"
      sha256 "f994cdfe9cc79c9bac959ebe14878a516c6306fa10a705757787991d143517fd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0/gw-macos-x64"
      sha256 "5a39b40d923b7584c78a02ed771acb21191f6da4c00bfe76e40a671f35252cfc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0/gw-linux-arm64"
      sha256 "71c1eaace83e4d66c6c00ade6cc4182c53adfe1c6abf440f9b83e03f99425920"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0/gw-linux-x64"
      sha256 "b01c23a3a109d9d0081016d8c6ff85e222ff14ba2ac27c7ca1ca8bed4d500c73"
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
