class Chiritori < Formula
  desc "Tool for removing time-limited source code"
  homepage "https://github.com/piyoppi/chiritori"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.5.0/chiritori-darwin-arm64.tar.gz"
      sha256 "7df1d308f815edcc7c2557a37d6affa8900053e9750da1a3516a8f387e78a54d"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.5.0/chiritori-darwin-x86_64.tar.gz"
      sha256 "25c6baca6ec5b74bac151d29dd4bb69b97533db6ca1282b044776fdbfcc3f59b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.5.0/chiritori-linux-arm64-musl.tar.gz"
      sha256 "522260ffa0776e1eaeda7d169e9c9e9c5529f055c37edeb70b203591d62e0171"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.5.0/chiritori-linux-x86_64-musl.tar.gz"
      sha256 "aa79f908f581c39b28ebb7f243504a0372860941dce2c2988b3b773ada3b738e"
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
