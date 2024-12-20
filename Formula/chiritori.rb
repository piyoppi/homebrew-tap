class Chiritori < Formula
  desc "Tool for removing time-limited source code"
  homepage "https://github.com/piyoppi/chiritori"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.4.0/chiritori-darwin-arm64.tar.gz"
      sha256 "629f4912d54efb983db23e08642bdb5429b6f71560e3da07cb75c960ae6214f1"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.4.0/chiritori-darwin-x86_64.tar.gz"
      sha256 "1d38c619780c06e0427ed0b21d76eb9e76a0d466004f31676d98b3d7d6e4c62b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.4.0/chiritori-linux-arm64-musl.tar.gz"
      sha256 "c212e289138eb053d3fb6dfa385cfba810e66b017724673c8a8c09085c0880ce"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.4.0/chiritori-linux-x86_64-musl.tar.gz"
      sha256 "9b893bd00a1d4dda355fb47a175fe805cb295118827cfa410fc7a77b692992f6"
    end
  end

  def install
    bin.install "chiritori"
  end

  test do
    output = shell_output(
      "echo 'a[marker name=\"f1\"]b[/marker]c' | chiritori --delimiter-start=\"[\" --delimiter-end=\"]\" --marker-removal-names=f1",
    ).strip

    assert_equal "ac", output
  end
end
