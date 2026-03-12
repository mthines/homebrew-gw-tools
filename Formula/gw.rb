class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.36.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.36.0/gw-macos-arm64"
      sha256 "44da92e3d7cc2aadde170c52123d47b5363af59dd350645152fbe61e258b4051"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.36.0/gw-macos-x64"
      sha256 "0bd05090c8b8b33994f8f8c5448dd13686a5c2be1b2d2d379ea9f24b68edae86"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.36.0/gw-linux-arm64"
      sha256 "3b5cacf15856b2cbfaea6777d06989a8e1a1801dc247dd8a803b62752bb6beb0"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.36.0/gw-linux-x64"
      sha256 "2e40de8fe3e58600ef451bb7d4c9c6404d7648a28ad6831fb0e7edb7b3dba278"
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
