class CreateShortMessages < ActiveRecord::Migration[7.2]
  def change
    create_table :short_messages do |t|
      t.jsonb :message_chunks

      t.timestamps
    end
  end
end
