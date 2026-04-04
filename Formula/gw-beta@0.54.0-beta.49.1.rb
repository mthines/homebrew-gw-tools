class GwBetaAT0540Beta491 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.54.0-beta.49.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0-beta.49.1/gw-macos-arm64"
      sha256 "4f12a8451e398faa7427334640e6a137ee66b558d1dcf347c4141025553d0538"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0-beta.49.1/gw-macos-x64"
      sha256 "dc70c605d2225d73098d28d800cf883a13fdc5b0bca0cc58e93b4e763434cfd7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0-beta.49.1/gw-linux-arm64"
      sha256 "f3310f5811021e6bb340d8269ae9e6b0864ff3a4504367826747b98a2411ecdf"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.54.0-beta.49.1/gw-linux-x64"
      sha256 "de8fc015ba85697e63c433679f3f25080618a4ade8e97c1c3cc3b5b3c7189c63"
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
