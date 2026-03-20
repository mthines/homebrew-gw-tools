class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.46.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.46.0/gw-macos-arm64"
      sha256 "4882315d6889cdc017a6361ddad1e1ac452cc67cfb867399416067cf50a1dcb0"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.46.0/gw-macos-x64"
      sha256 "f4c891ceecbe6db42fd6b9c08c987ea427c579b9dac0e8583e4b60b092027bc0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.46.0/gw-linux-arm64"
      sha256 "1d3c44cf715336197bf53b95bbc4c4e09dafb6933bd0c235980a32c4884cc360"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.46.0/gw-linux-x64"
      sha256 "968374edcdd2134316cf252142b8a0abb4ff1cc7be5ae875c7bc7359afb145fb"
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
