class Chiritori < Formula
  desc "Tool for removing time-limited source code"
  homepage "https://github.com/piyoppi/chiritori"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.0/chiritori-darwin-arm64.tar.gz"
      sha256 "a2afff8da299739204f13a699c7462e56712590fc15eaf265b099290a24ceb21"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.0/chiritori-darwin-x86_64.tar.gz"
      sha256 "8bd64aa644f6f10002b833b199ac29cd36626cc4e2fca2382b93b12a71b7f5ab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.0/chiritori-linux-arm64-musl.tar.gz"
      sha256 "7d0e701b660924a68d57d76fca8e7c524b9842564520c960fb41f230e377ff64"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.0/chiritori-linux-x86_64-musl.tar.gz"
      sha256 "dfaef373d016018d00ac87023348ce0e76eedd1c5d22071f51aebf8785d82f8b"
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
