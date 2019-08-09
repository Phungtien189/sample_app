class CompanyForm
  include ActiveModel::Model
  include Virtus

  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  # Attributes (DSL provided by Virtus)
  attribute :name, String
  attribute :code, String

  def save
      persist!
      true
  end

  private

  def persist!
    @company = Company.create!(name: name, code: code)
  end
end