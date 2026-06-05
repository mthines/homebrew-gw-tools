class GwBetaAT0620Beta721 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.62.0-beta.72.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.1/gw-macos-arm64"
      sha256 "190a24e2ff9b74be1c8b1f1c43c00db2059d1c02f8a51314616144840224bbf7"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.1/gw-macos-x64"
      sha256 "68905531d6f874a459a9d3ffd28bdd5528630beaa4ea1bdb0aec45153d10da25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.1/gw-linux-arm64"
      sha256 "5daa4348188f50b0da0663946c2463a5760483937d0308597d86c80064450073"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.1/gw-linux-x64"
      sha256 "08ddb663f15977f17bb915e61a19e7f7908f8cf33d286a9804b40c8b06fef84a"
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
