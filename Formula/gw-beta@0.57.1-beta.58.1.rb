class GwBetaAT0571Beta581 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.57.1-beta.58.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.1-beta.58.1/gw-macos-arm64"
      sha256 "321ef37c640a4b01e34ddee83386825aa34a53263e61497b56c58d53cc5093ae"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.1-beta.58.1/gw-macos-x64"
      sha256 "47ed3160eb98a52723d05b37d653b2ca02c427b1304dff86cb68002f61409445"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.1-beta.58.1/gw-linux-arm64"
      sha256 "a29daa41bbd4fc45b7c94f3cb9c47da26ec7cb247fab932b7f62af920cf630f8"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.1-beta.58.1/gw-linux-x64"
      sha256 "91f8b0132a4c45d8eab456a10211698eccbc7beedd658715b405d1e451861f42"
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
