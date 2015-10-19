class CreateScoots < ActiveRecord::Migration
  def change
    create_table :scoots do |t|
      t.string :subject
      t.text :body
      t.date :leave_from
      t.date :leave_to
      t.string :state, default: "pending"
      t.text :reason
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
