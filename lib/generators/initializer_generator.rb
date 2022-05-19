class InitializerGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('templates', __dir__)

    # def create_initializer_file
    #   create_file "config/initializers/initializer.rb", "# Add initialization content here"
    # end
    
    def copy_initializer_file
        copy_file "initializer.rb", "config/initializers/#{file_name}.rb"
    end

    def create_helper_file
      create_file "app/helpers/#{file_name}_helper.rb", <<-FILE
  module #{class_name}Helper
    attr_reader :#{plural_name}, :#{plural_name.singularize}
  end
      FILE
    end
  end 