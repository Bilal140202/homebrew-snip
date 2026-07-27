class Snip < Formula
  desc "Project-scoped command snippets with built-in fuzzy finder"
  homepage "https://github.com/Bilal140202/snip"
  url "https://github.com/Bilal140202/snip/releases/download/v0.5.0/snip-x86_64-macos"
  sha256 "dda5a3b856af557adaeb2f836d921fea0e2962fd8f39b8cdc1ce1b3a948a1810"
  license "MIT"
  version "0.5.0"

  # Livecheck: look at the latest GitHub release tag.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/Bilal140202/snip/releases/download/v0.5.0/snip-aarch64-macos"
      sha256 "cb4131575b24927c6076521b0cf2864e56b35aaf04177fdf7cd77699a1b49fc5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bilal140202/snip/releases/download/v0.5.0/snip-x86_64-linux"
      sha256 "8d96cb5ea1894ac23cbbe514eebcc64a1d6cf2101ae1359167cb9303094e8c1b"
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
