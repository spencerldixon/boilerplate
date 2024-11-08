module JsInstaller
  def install_package_with(package_manager=:importmaps, package_name)
    case package_manager.to_sym
    when :importmaps then
      run "./bin/importmap pin #{package_name}"
    when :bun then
      run "bun install #{package_name}"
    when :npm then
      run "npm install #{package_name}"
    end
  end
end
