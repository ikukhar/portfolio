class User < ActiveRecord::Base

  has_attached_file :avatar, styles: { medium: "128x128>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates_presence_of :name, :surname, :phone, :date_of_birth
  validates_format_of :phone, with: /\([0-9]{3}\) [0-9]{3}-[0-9]{2}-[0-9]{2}/

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
