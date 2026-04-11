class GwBetaAT0550Beta511 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.55.0-beta.51.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0-beta.51.1/gw-macos-arm64"
      sha256 "9ad5cac9d836c2bc627bf84e82de48d0dfef1b3e3ea1535dc2896a7b70f12219"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0-beta.51.1/gw-macos-x64"
      sha256 "0376531276159064527413bec16adcf28eb26f4aa19352f1cd0f4803c669e0ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0-beta.51.1/gw-linux-arm64"
      sha256 "b125616df098d6a0a1fab66646e548c3582652c7e33a5fb77cdb6b3aefe3a391"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.55.0-beta.51.1/gw-linux-x64"
      sha256 "28cbaa5d4bcdc5753a48c49c6d11d5a13ca1f7af62358b5b54a03ac6b43b4b0b"
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
