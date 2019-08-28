# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_28_133637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "incident_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incident_motives", force: :cascade do |t|
    t.bigint "motive_id"
    t.bigint "incident_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_incident_motives_on_incident_id"
    t.index ["motive_id"], name: "index_incident_motives_on_motive_id"
  end

  create_table "incident_recommendations", force: :cascade do |t|
    t.bigint "incident_category_id"
    t.bigint "recommendation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_category_id"], name: "index_incident_recommendations_on_incident_category_id"
    t.index ["recommendation_id"], name: "index_incident_recommendations_on_recommendation_id"
  end

  create_table "incidents", force: :cascade do |t|
    t.bigint "user_id"
    t.text "description"
    t.date "date"
    t.boolean "recurrent"
    t.boolean "author_is_victim"
    t.string "address"
    t.boolean "publication_agreement"
    t.string "place_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "incident_category_id"
    t.string "description_after_feeling"
    t.string "description_about_testimony"
    t.index ["incident_category_id"], name: "index_incidents_on_incident_category_id"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "motives", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "non_profits", force: :cascade do |t|
    t.bigint "motive_id"
    t.string "name"
    t.string "contact_email"
    t.text "description"
    t.string "logo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["motive_id"], name: "index_non_profits_on_motive_id"
  end

  create_table "proofs", force: :cascade do |t|
    t.bigint "incident_id"
    t.bigint "testimony_id"
    t.string "media_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_proofs_on_incident_id"
    t.index ["testimony_id"], name: "index_proofs_on_testimony_id"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "is_an_action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.bigint "incident_id"
    t.string "report_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_reports_on_incident_id"
  end

  create_table "testimonies", force: :cascade do |t|
    t.bigint "incident_id"
    t.string "cerfa_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_testimonies_on_incident_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gender"
    t.date "age"
    t.string "ethnic_origin"
    t.string "sexual_orientation"
    t.string "education"
    t.string "job_status"
    t.string "marital_status"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "incident_motives", "incidents"
  add_foreign_key "incident_motives", "motives"
  add_foreign_key "incident_recommendations", "incident_categories"
  add_foreign_key "incident_recommendations", "recommendations"
  add_foreign_key "incidents", "incident_categories"
  add_foreign_key "incidents", "users"
  add_foreign_key "non_profits", "motives"
  add_foreign_key "proofs", "incidents"
  add_foreign_key "proofs", "testimonies"
  add_foreign_key "reports", "incidents"
  add_foreign_key "testimonies", "incidents"
end
