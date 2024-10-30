class Chiritori < Formula
  desc "A tool for finding and removing time-limited source code."
  homepage "https://github.com/piyoppi/chiritori"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.0.0-alpha.1/chiritori-darwin-arm64.tar.gz"
      sha256 "027830733c6cee7de0d8f9a28b283c9835c13e294a097b7cd3803668f3ae4327"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.0.0-alpha.1/chiritori-darwin-x86_64.tar.gz"
      sha256 "edccbf6c12b20f1808f3a73c8d23152228c391bb4b60b368adc8fec8ebbe9546"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.0.0-alpha.1/chiritori-linux-arm64-musl.tar.gz"
      sha256 "3cf181f8eec1e0094170d3d42f44f4f6deaade679c6c1d6539912a64477e6b48"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.0.0-alpha.1/chiritori-linux-x86_64-musl.tar.gz"
      sha256 "ed87f2d0fb1c64c347c65019ce0c2afc7978966b9b7bd4ec0c67bc7379a43c21"
    end
  end

  def install
    bin.install "chiritori"
  end

  test do
    output = shell_output("echo 'a[marker name=\"f1\"]b[/marker]c' | chiritori --delimiter-start=\"[\" --delimiter-end=\"]\" --marker-removal-names=f1").strip
        
    assert_equal "ac", output
  end
end
