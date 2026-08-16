class Yams < Formula
  desc "Offline semantic memory search for coding-agent corpora"
  homepage "https://github.com/PonchoPig/yams"
  url "file://#{Dir.home}/dev/yams/dist/yams-0.1.0-aarch64-apple-darwin.tar.gz"
  sha256 "b1d6bda69181ba4d20ace98c3d08b4ba7a66341455f83fca445906304d3c9ff5"
  license any_of: ["Apache-2.0", "MIT"]

  depends_on arch: :arm64
  depends_on macos: :sonoma

  def install
    bin.install "yams", "memory-search", "yams-service", "yams-wiki"
  end

  service do
    run [opt_bin/"yams-service"]
    keep_alive false
    log_path "#{Dir.home}/Library/Logs/yams/launchd.stdout.log"
    error_log_path "#{Dir.home}/Library/Logs/yams/launchd.stderr.log"
  end

  def caveats
    <<~EOS
      First run downloads the embedding model (~550 MB) into
      ~/Library/Caches/yams. Inside a project that already contains
      .agents/memory, run:
        YAMS_ALLOW_NET=1 yams --index
      All later operation is offline. A stalled download is safely
      interrupted with Ctrl-C and rerun.

      Optional warm-query service:
        brew services start yams
      After upgrading yams, restart it:
        brew services restart yams

      State lives in:
        ~/Library/Caches/yams
        ~/Library/Application Support/yams
        ~/Library/Logs/yams
      Uninstalling never deletes these. Memories live in your projects
      (.agents/memory) and are never touched.
    EOS
  end

  test do
    ENV["YAMS_HOME"] = (testpath/"state").to_s
    ENV["YAMS_NO_SERVICE"] = "1"
    (testpath/"state").mkpath
    output = shell_output("#{bin}/yams --projects --json")
    assert_match '"ok":true', output
    assert_match "yams-wiki 0.1.0", shell_output("#{bin}/yams-wiki --version")
  end
end
