class GwBetaAT0590Beta642 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.59.0-beta.64.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.2/gw-macos-arm64"
      sha256 "7725baf83e719fdbdf41d4a26259dca668f475dca2edd7ea3160736abb96627e"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.2/gw-macos-x64"
      sha256 "e08783b2e6c90dac57b14ebd8cd7395b6c70534c89371bc7b52c43ff5208275f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.2/gw-linux-arm64"
      sha256 "21dc2ef8fc808aafcfb9754473298be9c78b450b6c6713e0fd9a0bcc5c47a426"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.59.0-beta.64.2/gw-linux-x64"
      sha256 "0599d15cf2fd7d9d573ae31eea10ee3ce608463c640ddaf0e17aeb31dab62a87"
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
