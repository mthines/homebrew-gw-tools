class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.29.0-beta.27.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.13/gw-macos-arm64"
      sha256 "7d6ba5783cd77ea3419a88f49823cc80b9bfe18f7018a9b5cfbf7880655bd0eb"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.13/gw-macos-x64"
      sha256 "a5cbeff33856d307eabeaacaf4f8e17b8ae308ec82193477a465fe5599435617"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.13/gw-linux-arm64"
      sha256 "88249e08877c503102da31e8ffd7bb2f07faaf09372a1489231b534f184e8154"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.13/gw-linux-x64"
      sha256 "31f86667ddf5c16e05939fd718598479685869255131dcbe7ddc9d84a532bc6f"
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
