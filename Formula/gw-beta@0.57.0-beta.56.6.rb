class GwBetaAT0570Beta566 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.57.0-beta.56.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.6/gw-macos-arm64"
      sha256 "2802dc7b4c25d2570ec8ba5301c9c3b75ec15b217f9ad2b1303371be2d7b07d4"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.6/gw-macos-x64"
      sha256 "d45173d6d0a7bd8f166cca152b6e77e6290d65140826e87d8dc3878625173856"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.6/gw-linux-arm64"
      sha256 "678c24490cfc4e348bdf4971097067847997cf1ea7c8b9bd32705e6c5748e3cc"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.6/gw-linux-x64"
      sha256 "cb21c07fe1aeb349e20e600aad887a4f363e84eee0251b4de82e95b422eac7a2"
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
