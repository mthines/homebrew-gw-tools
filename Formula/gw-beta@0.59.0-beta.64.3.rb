class GwBetaAT0590Beta643 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.59.0-beta.64.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.3/gw-macos-arm64"
      sha256 "3b26151c4f484c3c9ccc88845e995d5236b6689f5347558ed9001708fe13b4e4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.3/gw-macos-x64"
      sha256 "ec28f63f4f3d70906fca7d27db28a43caf29c7920856068bb24a33dfa4826605"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.3/gw-linux-arm64"
      sha256 "800eb38fa576300fe65f2a7d54c4af82161248652b42dbf2c55f70d622ddf6fc"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.3/gw-linux-x64"
      sha256 "436e7be5a901c25e3b9ffe60e597a5ddb895d55b565788fe577e0dbb7203eeb6"
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
