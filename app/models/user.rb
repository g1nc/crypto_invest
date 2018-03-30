class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :trackable,
  devise :database_authenticatable, :registerable, :validatable

  has_many :user_icos

  def profit
  	(total_balance + total_cashout - total_deposit) / start_deposit
  end

  def total_balance
  	crypto + ico
  end
end
