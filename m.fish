function m --description 'Mount music directory and start rmpc'
    systemctl --user start home-ima-Music.mount
    rmpc
end
