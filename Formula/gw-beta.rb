class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.43.0-beta.40.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.40.1/gw-macos-arm64"
      sha256 "64ca02a6100afe8d825687d54dd633267811b367fb565e952b390eeef26366f2"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.40.1/gw-macos-x64"
      sha256 "8173cc327cc44efec0ca30b5719b235ba8428d389a2e948abb67534ab8cd8622"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.40.1/gw-linux-arm64"
      sha256 "db1444dad8bba8449974252b04ff8851e51c86d005c46bebf0a37d7eac2bc87c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.43.0-beta.40.1/gw-linux-x64"
      sha256 "5117262b57696d8d746d4d6bf6c6faa08946c9768cd77806649c51d8e576e6aa"
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
