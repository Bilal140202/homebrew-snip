class Snip < Formula
  desc "Project-scoped command snippets with built-in fuzzy finder"
  homepage "https://github.com/Bilal140202/snip"
  url "https://github.com/Bilal140202/snip/releases/download/v0.3.4/snip-x86_64-macos"
  sha256 "437b09535c8117a2a634433af8951b7eacff2106e226479ad146ada0308c6156"
  license "MIT"
  version "0.3.4"

  # Livecheck: look at the latest GitHub release tag.
  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  on_macos do
    on_arm do
      url "https://github.com/Bilal140202/snip/releases/download/v0.3.4/snip-aarch64-macos"
      sha256 "bad1c5d67b42fddc31aebccd106ae07f98cc77844cbe69a7cbbedb42b5da0ada"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/Bilal140202/snip/releases/download/v0.3.4/snip-x86_64-linux"
      sha256 "4ab1f4d53eade682c4d8b9cbabeea3531833d3d83208bf08dda301662df4fe12"
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
