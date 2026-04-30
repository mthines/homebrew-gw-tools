class GwBetaAT0582Beta601 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.58.2-beta.60.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.2-beta.60.1/gw-macos-arm64"
      sha256 "51feb3bbabf550387ad3a39d059e98468d2ad75566748280fc87dd326b82a7cd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.2-beta.60.1/gw-macos-x64"
      sha256 "8fda2b54a9daf532b863a8f4649bf337f6cc222d958ea439a423bfa6de1603d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.2-beta.60.1/gw-linux-arm64"
      sha256 "d3fee5b7f82ebc107731626b11865d29c8afb7937bb784f0703e3d6a641497f9"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.58.2-beta.60.1/gw-linux-x64"
      sha256 "a363a464bfd7bc01ff310657687c2cd06e139a07a031cef7ea0758f6c0e2cec6"
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
