class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.38.0-beta.39.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.39.1/gw-macos-arm64"
      sha256 "5ae0a71c94663c17c2ca1db673792bf0fcdc15fe56ec57475501a5dc34125b3e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.39.1/gw-macos-x64"
      sha256 "e223954526ea2affb2b467735a91026f4ee9fb6e5c7a93fd85417e1adc131634"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.39.1/gw-linux-arm64"
      sha256 "912b0d63c77c77f3c508157ff22a206c4f64a171c1293bf00e79f32af486b7d8"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.38.0-beta.39.1/gw-linux-x64"
      sha256 "35e80a1c11e3c21ff797cb0e9f78f1e35bb1701dd2eaadf253f3720d5d3facc5"
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
