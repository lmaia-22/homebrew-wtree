class Wtree < Formula
  desc "Bare-clone git worktrees, without the ceremony"
  homepage "https://github.com/lmaia-22/wtree"
  url "https://github.com/lmaia-22/wtree/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "97e08f6607e108f25dbaab78e901d1a6f29a2b85a9d7830819e10a187996e97a"
  license "MIT"

  depends_on "fzf"
  depends_on "gh"

  def install
    bin.install "wtree.sh" => "wtree"
    pkgshare.install "shell/wtree.zsh"
    pkgshare.install "shell/wtree.bash"
  end

  def caveats
    <<~EOS
         ⢀⣠⣴⣶⣶⣦⣄⡀
       ⢀⣴⣿⣿⣿⣿⣿⣿⣿⣦⡀     wtree v#{version}
      ⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄    bare-clone git worktrees
       ⠙⠻⢿⣿⣿⣿⣿⠿⠟⠋     without the ceremony
            ║
            ╩

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
