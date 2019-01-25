class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :name, presence:true,length: { minimum: 3 }
  validates :email_address, presence:true,uniqueness: true
  validates :price, presence:true
  validates :seat_id_seq, presence:true
  validates :address, presence:true
  validates :price, presence:true
  validates :phone, presence:true
end
