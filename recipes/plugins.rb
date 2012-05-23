
package "python-nagiosplugin"
package "python-pyes"

git node.icinga.custom_plugins_dir do
    repository node.icinga.custom_plugins_repo
    reference "master"
    action [:checkout, :sync]
end

