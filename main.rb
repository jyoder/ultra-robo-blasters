$LOAD_PATH << [File.dirname(__FILE__), 'src'].join('/')
require 'window/factory'

Window::Factory.new.window.show
