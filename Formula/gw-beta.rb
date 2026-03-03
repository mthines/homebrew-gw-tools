class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.21.0-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.21.0-beta.1/gw-macos-arm64"
      sha256 "313dde62beb71cd5801ed7a650131aab4fc9e6278933e800a24533715861efac"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.21.0-beta.1/gw-macos-x64"
      sha256 "a28e8cc8255d39d54456c5bd2d8d7ea054fbf9970ae01fc6e95f503091ce9c2d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.21.0-beta.1/gw-linux-arm64"
      sha256 "751697db48cedd0ebf199a28b92634267196497416c072525b68eee087b6458e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.21.0-beta.1/gw-linux-x64"
      sha256 "2fcca9ceb7d5ada872249103f556bcb9c223c5a8397275483f35d4f831bc0ffc"
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
