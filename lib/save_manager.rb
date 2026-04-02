require 'yaml'

class SaveManager
  SAVE_FILE = 'save.yml'

  def save(state_hash)
    File.write(SAVE_FILE, YAML.dump(state_hash))
  end

  def load
    YAML.load_file(SAVE_FILE)
  end

  def save_exists?
    File.exist?(SAVE_FILE)
  end

  def delete_save
    File.delete(SAVE_FILE)
  end

end