class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  validate :picture_size

  default_scope -> {order created_at: :desc}

  mount_uploader :picture, PictureUploader

  private
  def picture_size
    if picture.size > 1.megabytes
      errors.add :picture, I18n.t("model.micropost.validate_file_size")
    end
  end
end
