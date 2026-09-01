class Wtree < Formula
  desc "Bare-clone git worktrees, without the ceremony"
  homepage "https://github.com/lmaia-22/wtree"
  url "https://github.com/lmaia-22/wtree/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "5b436cc46cb10f46a500da98e0e6a076516cd97be2b738b7d895f86e5ad02485"
  license "MIT"

  depends_on "fzf"

  def install
    bin.install "wtree.sh" => "wtree"
    pkgshare.install "shell/wtree.zsh"
    pkgshare.install "shell/wtree.bash"
  end

  def caveats
    <<~EOS
      To enable `wtree switch` and tab-completion, source the shell
      integration file for your shell in your rc file:

        zsh:  source "#{pkgshare}/wtree.zsh"
        bash: source "#{pkgshare}/wtree.bash"

      Then restart your shell.
    EOS
  end

  test do
    assert_match "wtree - bare-clone git worktrees", shell_output("#{bin}/wtree --help")
  end
end
