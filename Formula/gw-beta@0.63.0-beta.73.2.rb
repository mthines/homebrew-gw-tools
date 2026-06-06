class GwBetaAT0630Beta732 < Formula
  link_overwrite "bin/gw"
  desc "Git worktree manager - Streamline your multi-branch development workflow (Beta)"
  homepage "https://github.com/mthines/gw-tools"
  version "0.63.0-beta.73.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.2/gw-macos-arm64"
      sha256 "746a0aa4e9f639ecd5a57bbf1ae88f12e8cd98df84b7a1b56f796bec773fb22c"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.2/gw-macos-x64"
      sha256 "bc7dd7298df820fba4976f6216dfcfc89eae3a3aee0cddec264118310f7df668"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.2/gw-linux-arm64"
      sha256 "2d3522afc1fb70a94bf7e37a980f63f3a5e859db4afd103cdcd98b4503709567"
    else
      url "https://github.com/mthines/gw-tools/releases/download/v0.63.0-beta.73.2/gw-linux-x64"
      sha256 "f2162492c4e937f1059fd0cfa10537caf8d261a2b71afb5058a8630f01c6fb4e"
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
