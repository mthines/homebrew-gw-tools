class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.29.0-beta.27.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.12/gw-macos-arm64"
      sha256 "ccabf3fc69f0703cf998c66beabf7e037e4fd49f58d796631f6c793fe8f40952"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.12/gw-macos-x64"
      sha256 "1611abb01f3571db1d0f0f1a024fe3988ec0145a801051014bb231395d80bfff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.12/gw-linux-arm64"
      sha256 "b4fd026da5285f6988baf510956848736adf59adbe3844fde5fa52e726542bd9"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.12/gw-linux-x64"
      sha256 "33235d72d9b1955dd879bcb1978bd7044ca7f07d6acd600c1bbfdb064cf47cc3"
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
