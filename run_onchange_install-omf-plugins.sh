#!/usr/bin/env fish

function install_omf_package_if_not_exist
    if test (omf list | grep -c "$argv") -eq 0
        echo "Installing omf package $argv"
        omf install "$argv"
    end
end

# Install oh-my-fish plugins
install_omf_package_if_not_exist colored-man-pages
install_omf_package_if_not_exist extract
install_omf_package_if_not_exist fzf
install_omf_package_if_not_exist gi
install_omf_package_if_not_exist git-flow
install_omf_package_if_not_exist wttr
