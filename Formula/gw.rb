class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.56.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.3/gw-macos-arm64"
      sha256 "e732bcfe5bab83ed64425aad61cbb6a0816570e9ba7a84b05f552fa62faf0ec0"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.3/gw-macos-x64"
      sha256 "1506cd9010dfc7eb0341744384968fad0247425384c9dac826d0ab02085146b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.3/gw-linux-arm64"
      sha256 "b5ea71ec4e37d4b8219d7ca215e60082649721e9cc9f90181ccba041050b7077"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.56.3/gw-linux-x64"
      sha256 "2efd76adac8deb7c6337bb61b3c0e93f5017af9d7d804052698d77af5b0ad68b"
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
