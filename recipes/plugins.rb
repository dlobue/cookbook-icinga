
package "python-nagiosplugin"
package "python-pyes"

git node.icinga.custom_plugins.dir do
    repository node.icinga.custom_plugins.repo
    revision node.icinga.custom_plugins.revision
    action [:checkout, :sync]
end

