class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.42.0-beta.40.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.42.0-beta.40.1/gw-macos-arm64"
      sha256 "3445498d689e1783befc5ab8ab06e47921013154c28145baba7e9a7ff32b4107"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.42.0-beta.40.1/gw-macos-x64"
      sha256 "98602b66584671032249b2b855faf0c60e5c0a6d9744949f9723d790804951c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.42.0-beta.40.1/gw-linux-arm64"
      sha256 "09842b6f8fb0a4c3332e773c9559c24c2cb4331fd6a9c05652466d6f7556cf68"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.42.0-beta.40.1/gw-linux-x64"
      sha256 "90bcee8e7014f7f22f1aa20f728a7cfbfd8e1974467eb067a373beed63681df2"
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
