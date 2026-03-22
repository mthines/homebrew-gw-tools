class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.52.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.4/gw-macos-arm64"
      sha256 "129f90bdbc8f3dc6ef39ddd6028b0c54836d71ecbbf16c68822ca3d006735243"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.4/gw-macos-x64"
      sha256 "f7d880a8b96bfd20987cd8640967db1175847afa69354f51c7b3030f87a960ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.4/gw-linux-arm64"
      sha256 "114137b44a64a61a02d74b88fe6de63db35efc948c84785b47f7b08f56a6a3c3"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.4/gw-linux-x64"
      sha256 "40fb859535428e508a34f4ac80ff4f02966c7fc6c2f652ff9d0a50d29aab3270"
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
