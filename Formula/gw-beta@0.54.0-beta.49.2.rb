class GwBetaAT0540Beta492 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.54.0-beta.49.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0-beta.49.2/gw-macos-arm64"
      sha256 "180d0255344c73711742c7fbbbd5a1b3825406e129427dc711fddee7341e1984"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0-beta.49.2/gw-macos-x64"
      sha256 "785bafb0a5374d48bbf1b94018159a4d44026c7ba02eb102eae7ab9a997cf2a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0-beta.49.2/gw-linux-arm64"
      sha256 "47f6ece2c4646bf7664536c086a22d90e52ec8f279816d51244264eea4c2099a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0-beta.49.2/gw-linux-x64"
      sha256 "a94a325dd1a214f2218b8b4b2b0d665338f3095c71b4d6810ab90c5884c4d77c"
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
