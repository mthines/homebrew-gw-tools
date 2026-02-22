class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.14/gw-macos-arm64"
      sha256 "1e9d2d72dff61aaa5386139dc9f325934f9814c5d84220b46db0974e843d7630"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.14/gw-macos-x64"
      sha256 "27957f483ebb48954287ebd071082bb57e76ddc35618111346610b26e3f821bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.14/gw-linux-arm64"
      sha256 "2e84f19e91f39dee8b3ba2b00dccc35ac92392a0c9b05c05e54213010f181e47"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.14/gw-linux-x64"
      sha256 "18120a995a2b18ab8fae5224f318f4f3db8a16909a204b2ffd083a032452f222"
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
