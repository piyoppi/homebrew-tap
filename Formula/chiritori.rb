class Chiritori < Formula
  desc "Tool for removing time-limited source code"
  homepage "https://github.com/piyoppi/chiritori"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.0/chiritori-darwin-arm64.tar.gz"
      sha256 "3fafc73577121a6a54ceec628d32c048292a01eadcfc5ce4979f075228635a8c"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.0/chiritori-darwin-x86_64.tar.gz"
      sha256 "54be06d8b0d8d77869999ec36a9a0e0b8369c60ea01e80d52e2dfab68ae1ffe5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.0/chiritori-linux-arm64-musl.tar.gz"
      sha256 "693883e068dccf1d264073da5eb394a7c346730be5e3ef36be6ac8aa04969145"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.0/chiritori-linux-x86_64-musl.tar.gz"
      sha256 "7899650ed325e05ac57348b1e72bd4fd082cc41cc263eb219a0a794d626dbf2a"
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
