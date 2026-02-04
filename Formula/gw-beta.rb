class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.15.0-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.15.0-beta.1/gw-macos-arm64"
      sha256 "fb744d9780c57918d3e2dcd95dda3a1402d1fd936fb1cc17ce827e330524449a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.15.0-beta.1/gw-macos-x64"
      sha256 "4d18c156f25abbbe530ca338b7b33a1ee85855e075387e50839255df241a4cd3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.15.0-beta.1/gw-linux-arm64"
      sha256 "45ca0541f2a5ca0e196ac60531d6b6e3684268f546d84967ebe4ddb77f36adf8"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.15.0-beta.1/gw-linux-x64"
      sha256 "3702e15e26436c63562f6595a32fd10e002c0cc028958d9cdae52d10fbde89d5"
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
