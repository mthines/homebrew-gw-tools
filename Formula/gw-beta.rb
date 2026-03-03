class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.21.0-beta.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.21.0-beta.2/gw-macos-arm64"
      sha256 "c8c3636db0cbbbf3b37266a576f7b1c9b30697fd52876172a063ccb64495abda"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.21.0-beta.2/gw-macos-x64"
      sha256 "1e4e009931b2eda2da5ccda103efc0e67bbbdf5caae4cbf0cfd0aea26eeda728"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.21.0-beta.2/gw-linux-arm64"
      sha256 "3b3f4e7ad6ba7f47abec268e60962060fbe9b69323829fc3d3940d36dc799662"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.21.0-beta.2/gw-linux-x64"
      sha256 "8b7f80dd509099bba62ae064f9bb369a8ada31d89d3533e6bd1d78f40021a697"
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
