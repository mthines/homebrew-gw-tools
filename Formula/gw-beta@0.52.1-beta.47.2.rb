class GwBetaAT0521Beta472 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.52.1-beta.47.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1-beta.47.2/gw-macos-arm64"
      sha256 "55da817b0dc5cdd02dfe4f764f3b5f14361a69aace9b0699c33e1cff049e36ed"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1-beta.47.2/gw-macos-x64"
      sha256 "b0ccef11a804b6ce0647d79a47f31c2781c59cb7b76489c4ced01838c4e6f782"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1-beta.47.2/gw-linux-arm64"
      sha256 "7b59c58cea371126bc3bfa62f745d62331df4080be897f68e90ed8862c30a9c6"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.52.1-beta.47.2/gw-linux-x64"
      sha256 "6284d6ee7c106db95c9568c643ae70a177c80499f06fe75e3f562601e341606a"
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
