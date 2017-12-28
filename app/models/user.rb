class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,user登録が出来ない様にする
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :minutes
  has_many :todos
end
