class Snip < Formula
  desc "Project-scoped command snippets with built-in fuzzy finder"
  homepage "https://github.com/Bilal140202/snip"
  url "https://github.com/Bilal140202/snip/releases/download/v0.4.0/snip-x86_64-macos"
  sha256 "8898ece1a26db41f6f4276840d7ebfa5f497d694b4ff72d8ec6ff32de36da5f9"
  license "MIT"
  version "0.4.0"

  # Livecheck: look at the latest GitHub release tag.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/Bilal140202/snip/releases/download/v0.4.0/snip-aarch64-macos"
      sha256 "6c3d51d69e1badaafea97c8df642294baeabcfda63a50e08d7818ad2edeb3954"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bilal140202/snip/releases/download/v0.4.0/snip-x86_64-linux"
      sha256 "b32d618dfb880be0735d1b6ccd95f1aaeccf6b38effd4cc1492fd894bb2917e6"
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
