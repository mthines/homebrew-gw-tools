class GwAT < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.0-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.0-beta.1/gw-macos-arm64"
      sha256 "bc176cb0a5e7328d3992d89b2aabc3ba35f7802b49d4a1153c4dffbb09d26a51"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.0-beta.1/gw-macos-x64"
      sha256 "1ff973bdb7397abb21a3b04817dd45197a68be713843e7874a8ede211ebd463b"
    end
  end

  def install
    bin.install "gw-macos-arm64" => "gw" if Hardware::CPU.arm?
    bin.install "gw-macos-x64" => "gw" if Hardware::CPU.intel?
  end

  test do
    assert_match "gw version", shell_output("#{bin}/gw --version")
  end
end
