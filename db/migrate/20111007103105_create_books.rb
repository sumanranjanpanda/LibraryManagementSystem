class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
	t.string:name
	t.string:author
	t.string:edition
	t.string:status
	t.string:total
	t.string:sl_no
	t.string:user_id, :default=> 0
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
