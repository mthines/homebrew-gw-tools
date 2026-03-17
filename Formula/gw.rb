class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.43.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0/gw-macos-arm64"
      sha256 "b10ecca8937869206a37dc7f926b0157e2141d1db22b1ce8c96ca81aaac957cc"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0/gw-macos-x64"
      sha256 "e532d6b1047be27baca0d8f6b40d37aa1f0ed9e5010b5f1b70dbc9717dcb7c08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0/gw-linux-arm64"
      sha256 "12d9254ef39e10c368926ac372beb38e8c97a91f8ccf4a0795439aaff073eebf"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0/gw-linux-x64"
      sha256 "109df8a40913704d37b468f8ab4c73514f13c3ba162129da25db550f712dc828"
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
