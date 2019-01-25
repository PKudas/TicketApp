class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy

  validates :artist, presence:true,length: { minimum: 3 }
  validates :price_low, :price_high, presence:true, numericality: { greater_than: 0 }
  validates :event_date, presence: true
  validate :should_have_correct_prices
  validate :date_cannot_be_past

  def should_have_correct_prices
      return if price_low && price_high && price_low <= price_high

      errors.add('Problem with prices','Prices are invalid')
    end

  def date_cannot_be_past
      return if event_date && event_date > Time.zone.today

      errors.add(:event_date,'Event date is invalid')
   end

end