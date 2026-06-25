class GwBetaAT0660Beta781 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.66.0-beta.78.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.0-beta.78.1/gw-macos-arm64"
      sha256 "8d8f2b25ea0e6e3bcd3f5b72c30afa30b57e8372cac30c43edf32de15b80dbd8"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.0-beta.78.1/gw-macos-x64"
      sha256 "6d618a4e00c4cbb9a94aece2fc3eb3361d340f99370631791397ae0967960952"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.0-beta.78.1/gw-linux-arm64"
      sha256 "799e218113de1a1d536023b550b9738875ab4c91219b09ef3ac81ae0e08f21db"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.66.0-beta.78.1/gw-linux-x64"
      sha256 "f02a4dc36ca118066ff1ff97d4adbdcc00afcbe197b23b37cb910b6fe103428f"
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
