class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.68.0-beta.83.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.68.0-beta.83.1/gw-macos-arm64"
      sha256 "a4d73ee25b7412efb4be1e18e3ae4a70c1d2a47f75dc11ae43e71e5077d1a63e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.68.0-beta.83.1/gw-macos-x64"
      sha256 "c25a37d287329db00a58557097d3d2c4d734bfa533647a2d8f0057de6b90ec60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.68.0-beta.83.1/gw-linux-arm64"
      sha256 "bb2191fdeec396c1736a714354dd215b9c7b93916d5eb40e451a518d4d761102"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.68.0-beta.83.1/gw-linux-x64"
      sha256 "efe0f9e2a5cf5c40853ef78b5e2b38d785bd1935ff3521f8cc701b34e7569aab"
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
