class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.31.3-beta.33.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.3-beta.33.1/gw-macos-arm64"
      sha256 "a3e1363a54aca4a16cf9b599c132b4494c00c6b07c1f516f598d36150b8dea38"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.3-beta.33.1/gw-macos-x64"
      sha256 "f484df6ff24c336dbd4ed38454d7edddd57e1e17171211c3b7861343b93e922a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.3-beta.33.1/gw-linux-arm64"
      sha256 "51fc40438724168aec9d5229aefd6a5c432ce306aa60564a42d5d1151ca51c9c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.31.3-beta.33.1/gw-linux-x64"
      sha256 "8f520fadff46665f51f91e457214bdd47b899438dba653b495c8004bc0dcd746"
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
