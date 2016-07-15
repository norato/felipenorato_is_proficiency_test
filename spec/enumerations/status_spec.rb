require 'rails_helper'

RSpec.describe Status, type: :model  do
  context 'Validations' do
    it { Status.list.to_a.should eq([1,0]) }
    it { Status.to_a.should eq([['Ativo', 1], ['Inativo', 0]]) }
  end
end
