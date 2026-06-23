class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.65.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.1/gw-macos-arm64"
      sha256 "6df0422eda17942bd9f59dcf59db0af3e6bfab9905d7a5bd35764bad7ce2f0eb"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.1/gw-macos-x64"
      sha256 "ef058782b08e101419fa8bc489ad5bbeaf8bca46fa8c407889efa5086db787a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.1/gw-linux-arm64"
      sha256 "f290d5c311831e73bdae117ed4cdcad20974cbd5ac24df357a9310189e93118f"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.65.1/gw-linux-x64"
      sha256 "6d606dab011016d481ebc5533ea6b5f68117a47096c8f6e7d71a0e6ee7713f2f"
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
