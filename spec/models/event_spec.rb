require 'rails_helper'

RSpec.describe Event, type: :model do

  subject{ build(:event) }

  describe 'validations' do
    it 'should be valid with default attributes'

    it 'should not be valid with a duplicate name' do
      create(:event, name: subject.name)
      expect(subject).not_to be_valid
    end

    it 'should not be valid with a blank name' do
      subject.name = ""
      expect(subject).not_to be_valid
    end

    it 'should not be valid with no source_id' do
      subject.source_id = ""
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
    it 'should respond to the :source association' do
      expect(subject).to respond_to(:source)
    end
  end


end
