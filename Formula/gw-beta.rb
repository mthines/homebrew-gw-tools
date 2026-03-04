class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.29.0-beta.27.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.7/gw-macos-arm64"
      sha256 "373d6790a0ae5f7f7913a65f4e94bcdc19f3d06813acc31a59a7f1dc2d22e56c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.7/gw-macos-x64"
      sha256 "e84714edbee2e00ffe6a82432a0cf1ca8bad2dd70dc3ea309f3fb24e49298e8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.7/gw-linux-arm64"
      sha256 "910e49d6cfa0602a03a73e0dde512a5fdbc6f11a16986c6803a99b0d5abb0b9a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.7/gw-linux-x64"
      sha256 "ddd05f2e1c610526cf19873ff177dd1ab95fd6567a9600e5c7b464ad66048e14"
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
