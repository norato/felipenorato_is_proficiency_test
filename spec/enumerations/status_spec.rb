require 'rails_helper'

RSpec.describe Status, type: :model  do
  context 'Validations' do
    it { Status.list.to_a.should eq([1,0]) }
    it { Status.to_a.should eq([['Active', 1], ['Inactive', 0]]) }
  end
end
