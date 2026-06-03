class GwBetaAT0612Beta702 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.61.2-beta.70.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2-beta.70.2/gw-macos-arm64"
      sha256 "c38a0d8d44b7b5b83cebe15b84eb91c57ab498c409d70618fda6c9cb4b425400"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2-beta.70.2/gw-macos-x64"
      sha256 "8ed6aa891cea3dd4cc85f05b5e76175aeec0535d2aa664716d359778535055ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2-beta.70.2/gw-linux-arm64"
      sha256 "01488bf20af676259d36409561cc82fe63680107e7bfa1335ec0e5a1af96a501"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.61.2-beta.70.2/gw-linux-x64"
      sha256 "ea34a410f47fde2ecc9eee8c0a2250350cd90190c03ef40912600a71d66611a3"
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
