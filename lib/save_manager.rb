require "yaml"

class SaveManager
  SAVE_FILE = "save.yml"

  def save (state_hash)
    File.write(SAVE_FILE, YAML.dump(state_hash))
  end

  
end