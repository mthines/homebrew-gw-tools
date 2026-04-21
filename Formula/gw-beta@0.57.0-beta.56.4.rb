class GwBetaAT0570Beta564 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.57.0-beta.56.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.4/gw-macos-arm64"
      sha256 "509c6983784ce493089091c243b1550548e0e84a5c70b60546df1ed78cfb1339"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.4/gw-macos-x64"
      sha256 "e0f8987a5ceb1da4d3a88f7059eb7db2dac488e9841620336af1299961e28741"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.4/gw-linux-arm64"
      sha256 "1e26b226bec1a84fd8588fdf0ed9a8e5652284582c11a6c35c76564d6af5dc86"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.57.0-beta.56.4/gw-linux-x64"
      sha256 "457cdc1a5c392d331efc1f553888712c6ad8af18228e960729fd3c2e5c945cc1"
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
