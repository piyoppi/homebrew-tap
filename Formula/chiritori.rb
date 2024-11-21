class Chiritori < Formula
  desc "Tool for removing time-limited source code"
  homepage "https://github.com/piyoppi/chiritori"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.1/chiritori-darwin-arm64.tar.gz"
      sha256 "ecf03be2aed56c673d751f807360e14389fcba69073b5ad52de6bad0670e6427"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.1/chiritori-darwin-x86_64.tar.gz"
      sha256 "990b029b981b3399374e0aa00083f34365403961fe0728e68fde816ea54db3e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.1/chiritori-linux-arm64-musl.tar.gz"
      sha256 "b5f0b73f1c82e36cb01d84b61e5204804ad06aeff2773567fc971a1dd5d8ee59"
    end

    on_intel do
      url "https://github.com/piyoppi/chiritori/releases/download/v1.2.1/chiritori-linux-x86_64-musl.tar.gz"
      sha256 "280693f4d259b32f36fd42136fd06ed710f8003d505fd3e40f71c3e3a95d95a1"
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
