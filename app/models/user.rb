class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :name, presence: true
    with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'に全角文字を使用してください' } do
      validates :last_name_kanji
      validates :first_name_kanji
    end
    with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'に全角カタカナを使用してください' } do
      validates :last_name_kana
      validates :first_name_kana
    end
    validates :birthday, presence: true
end
