# frozen_string_literal: true

require 'csv'
require 'pry'

file_path = 'csv/x-ken-all.csv' # CSVのパス
postal_data = [] # 郵便番号データ

# TODO: 都道府県別の制限

CSV.foreach(file_path, headers: true, encoding: 'Shift_JIS:UTF-8') do |row|
  postal_data << {
    prefecture: row[6],
    city: row[7],
    town: row[8]
  }
end

# CSVファイルへの出力パス
output_file_path = 'area_data.csv'

# CSVファイルを開く（書き込みモード）
CSV.open(output_file_path, 'w') do |csv|
  # ヘッダー行を書き込む
  csv << %w[prefecture city town]

  # 郵便番号データを一行ずつCSVに書き込む
  postal_data.each do |data|
    csv << [data[:prefecture], data[:city], data[:town]]
  end
end
