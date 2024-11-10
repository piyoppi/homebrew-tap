class Chiritori < Formula
  desc "Tool for removing time-limited source code"
  homepage "https://github.com/piyoppi/chiritori"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.1.0/chiritori-darwin-arm64.tar.gz"
      sha256 "b768934946364a5826b03c9286e12b91523ff5d8df54dcc2bf37d09b4727cd38"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.1.0/chiritori-darwin-x86_64.tar.gz"
      sha256 "849ecfff58281af630e7d8b8ce0e25bdeaaa13ebc04631336e1ca0bb651c4868"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.1.0/chiritori-linux-arm64-musl.tar.gz"
      sha256 "b34441fcd2b470708779c41d8f66f3d11899a0c913c31415e6923d9c57590e89"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.1.0/chiritori-linux-x86_64-musl.tar.gz"
      sha256 "fce378eff522c4dfd3664f90bc65d9105ccc8b17c725c895d299cd1d07db6110"
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
