# zshrc.d 読み込み
if [ -d $ZDOTDIR/.zshrc.d ]; then
    for file in $ZDOTDIR/.zshrc.d/*.zsh; do
        source $file
    done
fi


function ssh_local() {
    local ssh_config=~/.ssh/config
    local server=$(cat $ssh_config | grep "Host " | sed "s/Host //g" | fzf)
    if [ -z "$server" ]; then
        return
    fi
    badge $server
    ssh $server
}
