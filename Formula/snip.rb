class Snip < Formula
  desc "Project-scoped command snippets with built-in fuzzy finder"
  homepage "https://github.com/Bilal140202/snip"
  url "https://github.com/Bilal140202/snip/releases/download/v0.3.5/snip-x86_64-macos"
  sha256 "99278cb8d148809fd2e75479d0ea37420ad6b1b46153f19b1bce1ba4fd2830f7"
  license "MIT"
  version "0.3.5"

  # Livecheck: look at the latest GitHub release tag.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/Bilal140202/snip/releases/download/v0.3.5/snip-aarch64-macos"
      sha256 "12b7050d9f3c9bddbaccfcffaa661adff13e14750fc6bedd058940db3a6201df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bilal140202/snip/releases/download/v0.3.5/snip-x86_64-linux"
      sha256 "429f3159e60b3ee76a61924f6bbf002d496adb62c38f434ac6951c419c45704b"
    end
  end

  # Pre-built binary release — no build dependencies needed.
  def install
    # The downloaded file IS the binary (no tarball). Rename it to `snip`.
    # Only one of these files will exist, depending on the platform.
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
