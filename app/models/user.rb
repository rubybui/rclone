require 'mail'
class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
        begin
            a = Mail::Address.new(value)
        rescue Mail::Field::ParseError
            record.errors[attribute] << (options[:message] || "is not an email")
        end
    end
end

class User < ApplicationRecord
    validates :name, presence: true, length: {minimum: 5}
    validates :username, presence: true, uniqueness: true, length: {in: 5..20}
    before_validation { |user| user.email = email.downcase }
    validates :email, presence:true, uniqueness: true, confirmation: true, email: true
    
end
