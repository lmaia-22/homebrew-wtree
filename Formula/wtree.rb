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
         \e[38;2;0;255;136m⢀⣠⣴⣶⣶⣦⣄⡀\e[0m
       \e[38;2;0;220;160m⢀⣴⣿⣿⣿⣿⣿⣿⣿⣦⡀\e[0m     \e[1;37mwtree\e[0m \e[90mv#{version}\e[0m
      \e[38;2;0;185;180m⢠⣿⣿⣿\e[38;2;220;40;40m⣿\e[38;2;0;185;180m⣿⣿\e[38;2;220;40;40m⣿\e[38;2;0;185;180m⣿⣿⡄\e[0m    \e[90mbare-clone git worktrees\e[0m
       \e[38;2;0;150;200m⠙⠻⢿⣿⣿⣿⣿⠿⠟⠋\e[0m     \e[38;2;0;185;180mwithout the ceremony\e[0m
            \e[38;2;180;120;60m║\e[0m
            \e[38;2;140;90;40m╩\e[0m

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
