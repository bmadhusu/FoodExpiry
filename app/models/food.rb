class Food < ActiveRecord::Base

  validates :food_name, :presence => true
  validate :expiry_is_after_purchase
  validates :price, numericality: {greater_than: 0}, allow_nil: true
  validates :qty, numericality: {greater_than: 0}, allow_nil: true

  def expiry_is_after_purchase
    errors.add(:expires_on, 'must be >= purchase date') if self.expires_on < self.acquired_on
  end

  def self.to_csv
    columns_to_export = %w(food_name expires_on qty brand unit acquired_on price food_type)
    CSV.generate do |csv|
#      csv << column_names
      csv << columns_to_export
      all.each do |food|
        csv << food.attributes.values_at(*columns_to_export)
      end
    end
  end

end
