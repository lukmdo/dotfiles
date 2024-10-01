# See https://github.com/rcaloras/bash-preexec/blob/master/README.md#quick-start
# setup in ~/bash_profile

# Example:
# echo ${preexec_functions[@]}              # TO PREVIEW
# preexec_functions=(preexec)               # TO RESET
# preexec_functions+=(preexec_hook_cmd)     # TO ADD


# hook up preexec_ functions by prefix/pattern
preexec_hook_cmd() {
    case $1 in
        @(k|kubectl)" config use-context "* ) preexec_kubectl_config_use_context "${1#@(k|kubectl) config use-context}";;
        *                                   ) ;;
    esac
}

preexec_kubectl_config_use_context() {
    local ctx_name=$(echo "$1" | tr -d " ")

    if grep -q "$ctx_name" ~/.kube/ctx.env; then
        source <(grep "$ctx_name" ~/.kube/ctx.env)
    else
        echo "no $ctx_name in ~/.kube/ctx.env - IGNORED"
    fi
}
