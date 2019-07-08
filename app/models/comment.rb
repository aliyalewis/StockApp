class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :stock, optional: true

  validate :there_can_be_only_one

  private

  def there_can_be_only_one
    if stock_count + user_count != 1
      errors.add(:base, "can only have one owner")
    end
  end

  def stock_count
    stock.present? ? 1 : 0
  end

  def user_count
    user.present? ? 1 : 0
  end

  def owner
    @owner ||= stock || library
  end


end
