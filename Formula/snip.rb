class Snip < Formula
  desc "Project-scoped command snippets with built-in fuzzy finder"
  homepage "https://github.com/Bilal140202/snip"
  url "https://github.com/Bilal140202/snip/releases/download/v0.3.1/snip-x86_64-macos"
  sha256 "ec383712deea95cffe71a36ac36cc5a3fdb3763f2e755b6490b32396e76dbf92"
  license "MIT"
  version "0.3.1"

  # Livecheck: look at the latest GitHub release tag.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/Bilal140202/snip/releases/download/v0.3.1/snip-aarch64-macos"
      sha256 "81865fc671e6c85d9e3dce04ae66adb0c587ec365001c10d26dcb3c4f0825d0c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bilal140202/snip/releases/download/v0.3.1/snip-x86_64-linux"
      sha256 "a0225c8f6825bc6b91005a0719e1d467b4bca19080b5130c491e14dd85be709b"
    end
  end

  # Pre-built binary release — no build dependencies needed.
  def install
    # The downloaded file IS the binary (no tarball). Rename it to `snip`.
    bin.install "snip-x86_64-macos" => "snip" if File.exist?("snip-x86_64-macos")
    bin.install "snip-aarch64-macos" => "snip" if File.exist?("snip-aarch64-macos")
    bin.install "snip-x86_64-linux" => "snip" if File.exist?("snip-x86_64-linux")
  end

  test do
    # `snip --version` should print the version
    assert_match "snip #{version}", shell_output("#{bin}/snip --version")
    # `snip --help` should print usage
    assert_match "Project-scoped command snippets", shell_output("#{bin}/snip --help")
  end
end
