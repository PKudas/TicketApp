class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :name, presence:true,length: { minimum: 3 }
  validates :email_address, presence:true,uniqueness: true
  validates :price, presence:true,numericality: true
  validates :seat_id_seq, presence:true
  validates :address, presence:true
  validates :price, presence:true
  validates :phone, presence:true
  validate :correct_price

  def correct_price
    @eventChosen = Event.find(event_id)

    return if price && price>=@eventChosen.price_low && price<= @eventChosen.price_high

    errors.add(:price,'Price is not in valid range')
  end


end
