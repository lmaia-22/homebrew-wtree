class Wtree < Formula
  desc "Bare-clone git worktrees, without the ceremony"
  homepage "https://github.com/lmaia-22/wtree"
  url "https://github.com/lmaia-22/wtree/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "a5df4aa228482be4f7b09ed629930035e4521e359fd65bf0d9fee899ba327a7a"
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
