class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Deviseの設定
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  # ニックネームのバリデーション
  validates :nickname, presence: true, length: { maximum: 40 }

  # メールアドレスのバリデーション（Deviseにより自動的に設定される）
  # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # パスワードのバリデーション（Deviseにより自動的に設定される）
  validates :password, presence: true, length: { minimum: 6 }

  # お名前（全角）のバリデーション
  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }

  # お名前カナ（全角）のバリデーション
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }

  # 生年月日のバリデーション
  validates :birth_date, presence: true
end
