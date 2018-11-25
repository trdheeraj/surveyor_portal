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

ActiveRecord::Schema.define(version: 2018_11_18_153109) do

  create_table "departments", force: :cascade do |t|
    t.string "name"
  end

  create_table "document_receiveds", force: :cascade do |t|
    t.integer "job_id"
    t.datetime "date"
    t.index ["job_id"], name: "index_document_receiveds_on_job_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "job_id"
    t.string "description"
    t.decimal "amount"
    t.index ["job_id"], name: "index_expenses_on_job_id"
  end

  create_table "insurances", force: :cascade do |t|
    t.string "name"
    t.string "gst_number"
    t.string "location"
  end

  create_table "job_statuses", force: :cascade do |t|
    t.integer "job_id"
    t.boolean "ila"
    t.datetime "ila_date"
    t.boolean "lor"
    t.datetime "lor_date"
    t.index ["job_id"], name: "index_job_statuses_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_number"
    t.integer "department_id"
    t.integer "insurance_id"
    t.string "customer_name"
    t.text "description"
    t.string "branch"
    t.string "state"
    t.string "appointed_by"
    t.date "dol"
    t.date "doi"
    t.string "status"
    t.boolean "all_documents_received"
    t.decimal "gross_loss"
    t.integer "report_number"
    t.integer "bill_number"
    t.index ["department_id"], name: "index_jobs_on_department_id"
    t.index ["insurance_id"], name: "index_jobs_on_insurance_id"
  end

  create_table "remainders", force: :cascade do |t|
    t.integer "job_id"
    t.datetime "date"
    t.index ["job_id"], name: "index_remainders_on_job_id"
  end

end
