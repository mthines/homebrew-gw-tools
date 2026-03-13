class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.37.0-beta.34.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.3/gw-macos-arm64"
      sha256 "a12191fa13019d1d760531990c4832a172921b0476d1e3bf017b83770621be9c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.3/gw-macos-x64"
      sha256 "6e86785d6202eeb05fb24e3037f5a23697f0957621ddf0e52c8ef27faa55c89e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.3/gw-linux-arm64"
      sha256 "c54ed848e152fab376cf647edc4a9b82f51e869ce636212d6ef4ed969e3febdf"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.37.0-beta.34.3/gw-linux-x64"
      sha256 "41f64195fd719869d5e985643ed87b158cfa26984f2e47464d78fc8e526b0f3e"
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
