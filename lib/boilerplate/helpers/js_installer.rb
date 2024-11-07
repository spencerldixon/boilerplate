module JsInstaller
  def install_package_with(package_manager=:importmaps, package_name)
    case package_manager
    when :importmaps do
      run "./bin/importmap pin #{package_name}"
    when :bun do
      run "bun install #{package_name}"
    end
  end
end
