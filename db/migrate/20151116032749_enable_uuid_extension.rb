class EnableUuidExtension < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp';
  end
  def down
    execute <<-SQL
      DROP EXTENSION "uuid-ossp";
    SQL
  end
end
