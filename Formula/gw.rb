class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.13.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.15/gw-macos-arm64"
      sha256 "06cce90932fdef75782e8d28991a7973b2e9ad93b54dff3fcfb771c22288adde"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.15/gw-macos-x64"
      sha256 "c603313db2eb6841074363199ea4425762cdb15a07b2efab86a27c541301d548"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.15/gw-linux-arm64"
      sha256 "1a674e3679db82213a28abff687ec6de11c8976d3956fa552997a80749606553"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.13.15/gw-linux-x64"
      sha256 "384f1024d60e725b2cc445b746716a7eac186c99950bcb9852dab946d6eccaab"
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
