class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.60.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.60.1/gw-macos-arm64"
      sha256 "3a207706d7e492098e1101584b2a2ab572ea5e7481adfc43aee0f4ccaaa40f7f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.60.1/gw-macos-x64"
      sha256 "f281fefad9bf9843f4b2d2f919d5b051e81fa7d3631e288a12786b146962eb5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.60.1/gw-linux-arm64"
      sha256 "e31df9dc06529106f8d47870ec25aea0a1433cc68556cf441c9f0d8c54b93939"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.60.1/gw-linux-x64"
      sha256 "2fe9840ff2378d2cb730f2bead9cd315455d782dab21df79bb1bc8b4c1e1f0dc"
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
