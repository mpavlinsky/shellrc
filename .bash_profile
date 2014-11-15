source ~/.shellrc

export PS1="\h:\W \u\[\e[1;36m\]\$(parse_git_branch)\[\e[0m\]$ " 

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function pr_for_sha {
  git log --merges --ancestry-path --oneline $1..master | grep 'pull request' | tail -n1 | awk '{print $5}' | cut -c2- | xargs -I % open https://github.paypal.com/PayPal-Mobile/ios-here-newgen/pull/%
}
