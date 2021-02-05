export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
export no_proxy="10.*.*.*,192.168.*.*,*.local,localhost,127.0.0.1"

source ~/.zinit/zinit.zsh
zinit snippet OMZL::bzr.zsh
zinit snippet OMZL::cli.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::compfix.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::correction.zsh
zinit snippet OMZL::diagnostics.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::functions.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::grep.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::misc.zsh
zinit snippet OMZL::nvm.zsh
zinit snippet OMZL::prompt_info_functions.zsh
zinit snippet OMZL::spectrum.zsh
zinit snippet OMZL::termsupport.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit snippet OMZP::git
zinit snippet OMZP::extract
zinit snippet OMZP::autojump
zinit ice svn pick="osx.plugin.zsh"
zinit snippet OMZ::plugins/osx
zinit snippet OMZP::kubectl
zinit snippet OMZT::ys

zinit load zsh-users/zsh-syntax-highlighting
zinit load zsh-users/zsh-autosuggestions
