
describe 'tinkering' do

  it 'should pass tests that are legit' do
    x = 3
    expect(x * 3).to eq 9
  end

  it 'should also pass this fake test' do
    expect(1 + 1).to eq 2
  end

  # it 'fails' do
  #   expect(true).to be false
  # end

end
