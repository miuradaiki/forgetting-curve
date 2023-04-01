require 'date'

class Reminder
  attr_accessor :name, :date, :interval

  def initialize(name, date, interval)
    @name = name
    @date = date
    @interval = interval
  end

  def next_reminder_date
    # 次回のリマインド日を計算する
    days_since_creation = (Date.today - @date).to_i
    reminder_days = @interval.map { |n| n * 2**(days_since_creation / n) }
    @date + reminder_days.min
  end

  def to_s
    # リマインド内容と次回のリマインド日を文字列で返す
    "Name: #{@name}\nNext reminder: #{next_reminder_date}"
  end
end

# リマインドを作成する
reminders = []
reminders << Reminder.new("タイトル１", Date.new(2023, 1, 1), [1, 3, 7, 14])
reminders << Reminder.new("タイトル２", Date.new(2023, 2, 1), [2, 7, 14, 30])

# 次回のリマインド日を表示する
reminders.each { |r| puts r.to_s }
