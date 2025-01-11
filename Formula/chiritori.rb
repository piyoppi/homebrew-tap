class Chiritori < Formula
  desc "Tool for removing time-limited source code"
  homepage "https://github.com/piyoppi/chiritori"
  version "1.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.4.1/chiritori-darwin-arm64.tar.gz"
      sha256 "a6063c48df9b535dae20eb028517c968b5e1e786db8036af21b651bfffbc9eca"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.4.1/chiritori-darwin-x86_64.tar.gz"
      sha256 "b099369286b2ab87af5633db9effd7f40f5eaf7792c1c7fe3b3e381612c01ee9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.4.1/chiritori-linux-arm64-musl.tar.gz"
      sha256 "91f4e44d915c8f4d8f4c7e4f9bafe47c8b92882e9242133f5bf8e1f7b7c243be"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.4.1/chiritori-linux-x86_64-musl.tar.gz"
      sha256 "6b225243bd163e8390ed05af043dcad33f49b9711b0cfa90554cc713595db097"
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
