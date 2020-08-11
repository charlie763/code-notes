class CreateTopicsNotesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :topics, :notes do |t|
      t.index [:topic_id, :note_id]
      t.index [:note_id, :topic_id]
    end
  end
end
