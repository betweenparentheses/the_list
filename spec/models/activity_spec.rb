require 'rails_helper'

RSpec.describe Activity, type: :model do
  subject{ build(:activity) }

  describe 'validations' do
    it 'should be valid with default attributes, name/description/category/location' do
      expect(subject).to be_valid
    end

    it 'should not be valid with a duplicate name' do
      create(:activity, name: subject.name)
      expect(subject).not_to be_valid
    end

    it 'should not be valid with a blank name' do
      subject.name = ""
      expect(subject).not_to be_valid
    end

    it 'should not be valid with no category_id' do
      subject.category_id = ""
      expect(subject).not_to be_valid
    end

    it 'should be valid with empty description' do
      subject.description = ""
      expect(subject).to be_valid
    end

    it 'should be valid with empty location' do
      subject.location = ""
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it 'should respond to the :category association' do
      expect(subject).to respond_to(:category)
    end
  end

end
