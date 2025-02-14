# See https://github.com/rcaloras/bash-preexec/blob/master/README.md#quick-start
# setup in ~/bash_profile

# Example:
# echo ${preexec_functions[@]}              # TO PREVIEW
# preexec_functions=(preexec)               # TO RESET
# preexec_functions+=(preexec_hook_cmd)     # TO ADD


# hook up preexec_ functions by prefix/pattern
preexec_hook_cmd() {
    case $1 in
        kxx)
            preexec_kubectl_config_use_context "$(. ~/.kube/prev-contex.env && echo $KUBE_PREV_CONTEXT)";;
        kx)
            set_vars_for_kube_ctx "$(kubectl config current-context)";;
        @(k|kubectl)" config use-context "* )
            preexec_kubectl_config_use_context "${1#@(k|kubectl) config use-context}";;
        * ) ;;
    esac
}

preexec_kubectl_config_use_context() {
	local ctx_name=$(echo "$1" | tr -d " ")

	# set prev_condex (used by kxx alias)
	export KUBE_CONTEXT="$ctx_name"
	if grep -qv "$(kubectl config current-context)" ~/.kube/prev-contex.env; then
		export KUBE_PREV_CONTEXT="$(kubectl config current-context)"
		echo "export KUBE_PREV_CONTEXT=\"$(kubectl config current-context)\"" > ~/.kube/prev-contex.env
	fi

	set_vars_for_kube_ctx "$ctx_name"
}

set_vars_for_kube_ctx() {
	local ctx_name=$(echo "$1" | tr -d " ")

    # reset all vars first
    . <(grep "export " ~/.kube/ctx.env  | awk -F'=' '{print $1"="}' | sort | uniq)

    if grep -q "$ctx_name" ~/.kube/ctx.env; then
        source <(grep "$ctx_name" ~/.kube/ctx.env)
    else
        echo "no $ctx_name in ~/.kube/ctx.env - IGNORED"
    fi
}
