ActiveRecord::Schema.define(version: 20150615232851) do
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end
end
