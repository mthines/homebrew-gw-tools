class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.56.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.1/gw-macos-arm64"
      sha256 "2c239b9373e001d934eb33c5c896835a8c5011d9990eb230b63015c401f07430"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.1/gw-macos-x64"
      sha256 "eda6101176f40baab3483e5be7df3be12886a4d1a21c68e671ca4ad077611295"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.1/gw-linux-arm64"
      sha256 "312e33faf05c768f37424b93ac37b04704685b1a6ce8854ad9d84b1abdbfdfc6"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.1/gw-linux-x64"
      sha256 "05ce890b4c95a248df06ed42d3d536934a2e928fa7670f58903bc9369c4780e6"
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
