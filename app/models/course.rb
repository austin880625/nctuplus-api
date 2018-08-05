class Course < ApplicationRecord
  belongs_to :semester
  belongs_to :last_edit_user, class_name: :User, optional: true
  belongs_to :permanent_course
  has_many :teachers_courses
  has_many :teachers, through: :teachers_courses
  has_many :users_courses
  has_many :users, through: :users_courses
  has_many :books_courses
  has_many :books, through: :books_courses
  has_many :course_ratings

  enum time_slot_code: [:M, :N, :A, :B, :C, :D, :X, :E, :F, :G, :H, :Y, :I, :J, :k, :L]

  # 現在課表在資料庫中使用 12bytes(96bit) 來表達佔用哪些時段 (16節課/天)
  # 因此需要轉換過後才能給前端使用 
  # TODO: 是否改在前端做?
  def convert_time_slots
    time_slots
      .chars                                              # 轉成 char array
      .each_slice(2)                                      # 切割成 6 個 2bytes 的 array 
      .map { |data| data.join('').unpack('S')[0] }        # 2bytes array => short
      .map.with_index do |data, index|                    # 對每個 short:
        16.times                                          #   從 0-16
          .select { |i| data & (1 << i) > 0 }             #   選擇該 bit 為 1 的位數
          .map { |i| self.class.time_slot_codes.key(i) }  #   轉成對應的 code
          .reduce((index + 1).to_s, :+)                   #   加上星期幾，將轉出來的 code 組起來
      end
      .select { |r| r.length > 1 }                        # 加上 filter 刪除，該天沒有課程的資料
      .join
  end

  # 改寫 json serializer，加上轉換過後的課程時間
  # TODO: 改用 fast_jsonapi? 需加上 raw data 嗎?
  def as_json(options={})
    super({**options, except: :time_slots}).tap do |result|
      result[:time_slots] = convert_time_slots
    end
  end

end
