class GwBetaAT0570Beta562 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.57.0-beta.56.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.2/gw-macos-arm64"
      sha256 "3c2e8510d621e7378ad89a8020ff45412e55142212db5382de0c2b22e0c16cc2"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.2/gw-macos-x64"
      sha256 "1b4bf9b578dca20f8ab9b626fffdd1e5876b228627501e7c23fcebb067ef0ff1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.2/gw-linux-arm64"
      sha256 "b8322f1e6a9ff904784329a2f2567e914ecc523ed0fdba066faab42be43dbd35"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.2/gw-linux-x64"
      sha256 "667bff31ec346c5b778e6cacdbcb4ceb1a0222d0183d1bd4a3d207e65c98f55a"
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
