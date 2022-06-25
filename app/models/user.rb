class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: "should contain both letters and numbers"}
    validates :name, presence: true
    with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'should be full-width characters' } do
      validates :last_name_kanji
      validates :first_name_kanji
    end
    with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'should be full-width katakana' } do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday, presence: true
end
