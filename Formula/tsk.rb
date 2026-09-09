class Tsk < Formula
  desc "A task board for your terminal"
  homepage "https://gettsk.sh"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/smarzban/herdr-tsk/releases/download/v0.7.0/tsk-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "a440819432eab7ad10754e48a364b60a3a90a3e24b12e92551fd37e60c187f23"
    end
    on_intel do
      url "https://github.com/smarzban/herdr-tsk/releases/download/v0.7.0/tsk-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "d89eb29271ebfe89c7ec3f0b7d7c29e6efec629b2b1a31eb555c281a58334bab"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/smarzban/herdr-tsk/releases/download/v0.7.0/tsk-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0f9eb476e7dc9efe4ab044f93d8f4af06e9b0cd7d42a349f970c2be4d0d3cb6d"
    end
    on_intel do
      url "https://github.com/smarzban/herdr-tsk/releases/download/v0.7.0/tsk-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "42e32fc1669590c0b001240faaf4903ca4d7c8683d44b08a9b182620d21dfd6d"
    end
  end

  def install
    bin.install "tsk"
  end

  def caveats
    "To register the shared tsk binary and shortcuts in Herdr, run: tsk setup herdr"
  end

  test do
    ENV["TSK_STATE_DIR"] = (testpath/"state").to_s
    ENV["TSK_CONFIG_DIR"] = (testpath/"config").to_s
    assert_match "usage: tsk", shell_output("#{bin}/tsk --help")
    system bin/"tsk", "add", "--desk", "-t", "Homebrew smoke"
    assert_match "Homebrew smoke", shell_output("#{bin}/tsk list --desk")
  end
end
