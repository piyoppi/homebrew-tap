class Chiritori < Formula
  desc "Tool for removing time-limited source code"
  homepage "https://github.com/piyoppi/chiritori"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.3.0/chiritori-darwin-arm64.tar.gz"
      sha256 "6130e7a270280d5412cbdea315a76852c5ed956c9baa9aaa3dad1b1df2b07268"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.3.0/chiritori-darwin-x86_64.tar.gz"
      sha256 "c881b9fae32e5f1c67b0bc9fa8a8dcd2098e57e18bb8972ee2307ab4536edafe"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.3.0/chiritori-linux-arm64-musl.tar.gz"
      sha256 "738554cd9120420c874de3f14f2dc31777552d1e487c383ab6455643ac9e25ef"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.3.0/chiritori-linux-x86_64-musl.tar.gz"
      sha256 "a52aee72742aa55b198e12c2f537d96472217ea4ea28991c6201b6db01f7eb4e"
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
