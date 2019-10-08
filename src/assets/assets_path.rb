module Assets

  class AssetsPath
    def self.path_to(filename)
      [File.dirname(__FILE__), '../../assets', filename].join('/')
    end
  end

end
