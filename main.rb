require_relative 'app'

# The main function creates an instance of the App
# class and calls its run method.
def main
  app = App.new
  app.load_data_from_json
  app.run
  app.save_data_to_json
end

main
