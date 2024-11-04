class Chiritori < Formula
  desc "Tool for removing time-limited source code"
  homepage "https://github.com/piyoppi/chiritori"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.0.0-alpha.1/chiritori-darwin-arm64.tar.gz"
      sha256 "0ab440d132569c234cae5f96122e22e184fb72c87128c4dbfc98102f2359bb95"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.0.0-alpha.1/chiritori-darwin-x86_64.tar.gz"
      sha256 "f7e07199ec4c40087d9f76bdf2a26792cf9b78f15e71e3a215bf93ee7abfe18d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.0.0-alpha.1/chiritori-linux-arm64-musl.tar.gz"
      sha256 "a343d8476b248e68ba246aa52a6943955c57cde61b37ba27e2438e9b78042158"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.0.0-alpha.1/chiritori-linux-x86_64-musl.tar.gz"
      sha256 "4981aeb3f84709e0f5c14c9a8648cc307dcca52a9119cf42068320a27f65f3dd"
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
