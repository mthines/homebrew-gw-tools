class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.58.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.2/gw-macos-arm64"
      sha256 "3d8ea5490b845484b95b97fc6eca4876e8a67eb3b834d78d4ca9d9b80fe2d9cd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.2/gw-macos-x64"
      sha256 "62e9b5486fa7df0ea2472b38eaf394d46bf49199ba6ed131b0b9cc04c24bd68f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.2/gw-linux-arm64"
      sha256 "aec524065507531ee5fdf1eca9ce6b943f862e537d716d9305223249ae5bd785"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.2/gw-linux-x64"
      sha256 "5193850e9ae83eb9ef7bdb1984863d5da9915e6ea6f02623082f252c4479972c"
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
