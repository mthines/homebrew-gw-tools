class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.69.0-beta.85.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0-beta.85.1/gw-macos-arm64"
      sha256 "c6e01f4748d1eb083f7f4507c9d9a25212fb6c1d7c3ddb40538b510f69172f70"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0-beta.85.1/gw-macos-x64"
      sha256 "536bee572a1bd38300c97428b4bcc64e4fde038a6648fdebff4dd95b44804cef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0-beta.85.1/gw-linux-arm64"
      sha256 "96d2ba9c9df49ce93ab883bedcc8bb859f23c0b587693c70a06bc6bb6323a57f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.69.0-beta.85.1/gw-linux-x64"
      sha256 "09b398d405dfa005d08ad56ff1bf8b723b42ad964decaafbd7e5096491ad36b7"
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
