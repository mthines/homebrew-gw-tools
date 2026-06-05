class GwBetaAT0620Beta724 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.62.0-beta.72.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.4/gw-macos-arm64"
      sha256 "4eb2380485399b6488424ef2cf5a610a245af68bb5cf89f28498fa53ed9d51cc"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.4/gw-macos-x64"
      sha256 "2d58a52d06d440a12ec5a0c831550b916a8036df1ebf050363e6530a536befa9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.4/gw-linux-arm64"
      sha256 "349f127e174c4cfbc65359449658527d0d47a1b0f4456b837a1a793063d55c7e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.62.0-beta.72.4/gw-linux-x64"
      sha256 "fc0e2ac74beaa0f409b2e76a2ad73e15d1a1bcac4326f025788551494aadf0d9"
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
