class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :sns_credentials, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :event_users, dependent: :destroy

  attachment :profile_image

  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :timeoutable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :follower
  has_many :followings, through: :relationships, source: :followed

  has_many :entries, dependent: :destroy
  has_many :chats, dependent: :destroy

  validates :name, presence: true, length: { in: 2..8 }, on: :update


  def follow(user_id) #フォローする
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id) #フォローを外す
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user) #フォローしていればtrue
    followings.include?(user)
  end

  def active_for_authentication? #退会済みなら弾く
    super && (self.is_delete == false)
  end

  def self.without_sns_data(auth)
    user = User.where(email: auth.info.email).first

    if user.present?
      sns = SnsCredential.create(
        uid: auth.uid,
        provider: auth.provider,
        user_id: user.id
      )
    else
      user = User.new(
        # nickname: auth.info.name,
        email: auth.info.email,
      )
      sns = SnsCredential.new(
        uid: auth.uid,
        provider: auth.provider
      )
    end
    return { user: user ,sns: sns}
  end

  def self.with_sns_data(auth, snscredential)
    user = User.where(id: snscredential.user_id).first
    unless user.present?
      user = User.new(
        # nickname: auth.info.name,
        email: auth.info.email,
      )
    end
    return {user: user}
  end

  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present?
      user = with_sns_data(auth, snscredential)[:user]
      sns = snscredential
    else
      user = without_sns_data(auth)[:user]
      sns = without_sns_data(auth)[:sns]
    end
    return { user: user ,sns: sns}
  end

  enum sex: { "男性" =>0, "女性" =>1 }
  enum style: { "スノーボーダー" =>0, "スキーヤー" =>1, "その他" =>2 }
end
