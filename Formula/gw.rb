class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.58.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.4/gw-macos-arm64"
      sha256 "81db9c618435851903cfaad2637085c1636cead404c6d81cf6935bc4cf6dbdee"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.4/gw-macos-x64"
      sha256 "69090e19f756e3651b2f4e5507ba693701cd4947ec392296b1371fea952b3935"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.4/gw-linux-arm64"
      sha256 "bb3a50e11f8bf09b8e35d3be6f220e55e6de4aa5216ded62a7732135c22764ec"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.4/gw-linux-x64"
      sha256 "8b4ee417c7fad0a092470400f0071c1c52a4dd9d09081a9d71e0d091358effcd"
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
