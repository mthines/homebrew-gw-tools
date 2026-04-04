class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.54.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0/gw-macos-arm64"
      sha256 "1a7a54bba5acad075f8b3a5e4215dd663d82dae06d7764c1c00e19d90738bccd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0/gw-macos-x64"
      sha256 "c10fc88dd186c7415457a98d0add2515510c62217717143f1c377b5e821f62f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0/gw-linux-arm64"
      sha256 "1cd9a94c01c552064a93bb9924bfcb1a36ad202a049556b227ddbfdea9fab619"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0/gw-linux-x64"
      sha256 "37dcf080251f9d088e9a11d20a95b0de295d0c597c94f457f97727da83245c6b"
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
