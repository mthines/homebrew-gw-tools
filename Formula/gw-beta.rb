class GwBeta < Formula
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.20.9-beta.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.9-beta.1/gw-macos-arm64"
      sha256 "537bef096d2ac60573ed862d007343fb32206b3eccbb9e4be90fa18198dbf24a"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.9-beta.1/gw-macos-x64"
      sha256 "a8507c8c17aa6700474dc8c8df1bc242903b43fb19901f9b29c4216724190bcd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.9-beta.1/gw-linux-arm64"
      sha256 "797ec70a24276bfe4b7f4ddb64f9058b064f4e79182143470cc997c3fd556e80"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.20.9-beta.1/gw-linux-x64"
      sha256 "f825530d4fe32ed827aa070be01a236cd82a38c9200f7d72f98c70110b7423cc"
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
