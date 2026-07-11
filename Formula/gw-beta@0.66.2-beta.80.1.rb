class GwBetaAT0662Beta801 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.66.2-beta.80.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.2-beta.80.1/gw-macos-arm64"
      sha256 "63c007023afe9b234f70bf77c84a5e85f7cde87a48ffdbe7acc19e1bad636d45"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.2-beta.80.1/gw-macos-x64"
      sha256 "628e9f29035dd7c4418dcbc462c06aba501174981d32beb1c575a68328ddf124"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.2-beta.80.1/gw-linux-arm64"
      sha256 "e74b3232009ff346de77332303ca95b4dcb5529ef03ecc64b3913afa49d0b65b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.2-beta.80.1/gw-linux-x64"
      sha256 "35e30e751e89a59b2b1b4baf57badce737a0f9767f6dc8cc17bee51e1279b9a8"
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
