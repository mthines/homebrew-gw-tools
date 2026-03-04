class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.29.0-beta.27.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.8/gw-macos-arm64"
      sha256 "ee80fdafb6044443f8b0d38682b7c5864783f5172725591f4b8c8086ef291762"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.8/gw-macos-x64"
      sha256 "a8fa48b7a27f66a5e2ab2de1816388a025ee90998ed75d4085bf96ed86c514ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.8/gw-linux-arm64"
      sha256 "44d9929f31f00bbda60273fb71619bf04f3c93c70f3e337b13548a6fc77f6ad0"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.29.0-beta.27.8/gw-linux-x64"
      sha256 "228527cf6984c4e21e065ab1a0bb3db210163932f7aa77de08af04ea8912ce26"
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
