class GwBetaAT0640Beta752 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.64.0-beta.75.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.2/gw-macos-arm64"
      sha256 "bd15efe1a3ae8f670cf079c4404187bcb1211f7bf819f51ec1f51252603c2159"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.2/gw-macos-x64"
      sha256 "1bc89f6143c66748865a55be507a13c06ce9c338fef10a594edf9e98ed157f45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.2/gw-linux-arm64"
      sha256 "8314a192c512a7e8ddf1bcd7c3a9676e8811e76c753ee469fdb752d19c36c515"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.64.0-beta.75.2/gw-linux-x64"
      sha256 "e043e2a5e9aa3bd4df2a3ead53ff09f48209eaa66bd299da945b777cf5467b10"
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
