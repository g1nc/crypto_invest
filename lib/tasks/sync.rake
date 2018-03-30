# frozen_string_literal: true

require "google_drive"

namespace :sync do
  task icos: :environment do
    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key("19_BCnracLc3rwIhyxmJtfG-fqJqxeFoycXYm3FkkNbI").worksheets[8]

    (1..ws.num_cols).each do |col|
      ico = Ico.find_or_initialize_by(name: ws[1, col])
      percent = ws[2, col].gsub('%', '')
      ico.update(percent: percent.present? ? percent.to_f : 0)
    end
  end

  task users: :environment do
    COLS = {
      ext_id:        1,
      name:          2,
      email:         3,
      start_deposit: 4,
      total_deposit: 5,
      total_cashout: 6,
      ico:           7,
      crypto:        8
    }

    ICO_START_COL = 14

    session = GoogleDrive::Session.from_config("config.json")
    ws = session.spreadsheet_by_key("19_BCnracLc3rwIhyxmJtfG-fqJqxeFoycXYm3FkkNbI").worksheets[6]

    (2..ws.num_rows).each do |row|
      user = User.find_or_initialize_by(ext_id: ws[row, COLS[:ext_id]])
      user.password = 'test123' if user.new_record?

      user.name          = ws[row, COLS[:name]]
      user.email         = ws[row, COLS[:email]]
      user.start_deposit = ws[row, COLS[:start_deposit]].to_f
      user.total_deposit = ws[row, COLS[:total_deposit]].to_f
      user.total_cashout = ws[row, COLS[:total_cashout]].to_f
      user.crypto        = ws[row, COLS[:crypto]].to_f
      user.save

      total_icos = 0
      (ICO_START_COL..ws.num_cols).each do |col|
        ico      = Ico.find_or_create_by(name: ws[1, col])
        user_ico = UserIco.find_or_initialize_by(user_id: user.id, ico_id: ico.id)
        
        value = ws[row, col]
        user_ico.value = value.present? ? value.to_f : 0
        total_icos += user_ico.value
        user_ico.save
      end

      user.update(ico: total_icos)
    end
  end
end
