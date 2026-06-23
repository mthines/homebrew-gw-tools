class GwBetaAT0652Beta771 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.65.2-beta.77.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.2-beta.77.1/gw-macos-arm64"
      sha256 "777c6b914fd4453e16b1b9850a79f323683d04e237ca2b666b7adfe26bf04615"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.2-beta.77.1/gw-macos-x64"
      sha256 "af215aa5c9b746139a5cb0d92e69288d775ee770c1d49c31a9f2a1880f9297bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.2-beta.77.1/gw-linux-arm64"
      sha256 "3220f79603cf825bbdd6092073810fde9938798f1336b604d0e5624db01ee67b"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.2-beta.77.1/gw-linux-x64"
      sha256 "c11ff505428f69a6962c75605dbb5da4baa11c7ebd539256268bde7cef14dc1a"
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
