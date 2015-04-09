require 'rails_helper'

RSpec.describe Category, type: :model do
  subject{ build(:category) }

  describe 'validations' do
    it 'should be valid with a unique name' do
      expect(subject).to be_valid
    end

    it 'should not be valid with a duplicate name' do
      create(:category, name: subject.name)
      expect(subject).not_to be_valid
    end

    it 'should not be valid with a blank name' do
      blank = Category.new
      expect(blank).not_to be_valid
    end

    it 'should be valid with no activities' do
      subject.activities.destroy_all
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it 'should respond to the :activities association' do
      expect(subject).to respond_to(:activities)
    end
  end


end
