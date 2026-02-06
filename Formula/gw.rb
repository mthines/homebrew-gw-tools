class Gw < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.5/gw-macos-arm64"
      sha256 "53244dba4049e8b177508e277f987093955899b5b8e5eab866f48082463b9dfd"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.5/gw-macos-x64"
      sha256 "bd4c9f37a5f237b090e55405892e17ca6f57ecade1e90997dee211a9dd52aebc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.5/gw-linux-arm64"
      sha256 "74444dd5a71c56ee5a1b86c9d95202f14ca408ed6ad0714499d536cdadf886e5"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.5/gw-linux-x64"
      sha256 "45a021072a19868dd6ee8d720b5cf8acfcf8d21512561bdcbc4eaae9837b4385"
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
