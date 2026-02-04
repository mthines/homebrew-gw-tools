class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.14.3-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.3-beta.1/gw-macos-arm64"
      sha256 "fb73de4cdb41c03a08d31a6968fae5d5bf68e669a6f4957674bcba45a6e170c4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.3-beta.1/gw-macos-x64"
      sha256 "d610903e5ad87afc9ad26ba8869d6f19118422ee98c768d1bbb7ce573887d4b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.3-beta.1/gw-linux-arm64"
      sha256 "ed812bbc7779827a843ba148c2e5bed89002768a03cc7314b190685f143053ce"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.14.3-beta.1/gw-linux-x64"
      sha256 "22ed4ac63b770cd03b0284e91c37e90fbd8e928e6eb3ff9eacc3cc760d3efd28"
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
