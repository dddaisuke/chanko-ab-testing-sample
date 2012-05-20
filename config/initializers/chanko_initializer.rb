Chanko.config.raise = true if Rails.env.development?
Chanko::Loader.add_path(Rails.root.join('app/units')) if Chanko::Loader.directories.blank?
Chanko.config.directory_name = 'units'
active_if_files = Pathname.glob(Rails.root.join("lib", "chanko", "active_if", "*.rb")).map(&:to_s)
Chanko::ActiveIf.files = active_if_files
