require 'rspec'
require_relative '../lib/array_shifting'

describe ArrayShifting do
  let(:array) {%w{a b c d e}}
  it 'to_front moves matching element to front of array and returns a new array' do
    moved = array.to_front("e")
    expect(moved).to eq(%w{e a b c d})
    expect(array).to_not eq(moved)
  end

  it 'to_front does not change array if element does not match' do
    expect(array.to_front("g")).to eq(array)
  end

  it 'to_front! permanently moves element to front of array' do
    moved = array.to_front!("e")
    expect(moved).to eq(%w{e a b c d})
    expect(array).to eq(moved)
  end

  it 'to_back moves matching element to end of array and returns a new array' do
    moved = array.to_back("a")
    expect(moved).to eq(%w{b c d e a})
    expect(array).to_not eq(moved)
  end

  it 'to_back does not change array if element does not match' do
    expect(array.to_back("g")).to eq(array)
  end

  it 'to_back! permanently moves element to end of array' do
    moved = array.to_back!("a")
    expect(moved).to eq(%w{b c d e a})
    expect(array).to eq(moved)
  end

  it 'swap moves element to specified position when using values and returns new array' do
    moved = array.swap("a","c")
    expect(moved).to eq(%w{c b a d e})
    expect(moved).to_not eq(array)
  end

  it 'returns self when value is not in self' do
    expect(array.swap("a","g")).to eq(array)
    expect(array.swap("g","c")).to eq(array)
    expect(array.swap(1, 10)).to eq(array)
  end

  it 'swap! permanently moves element to specified position when using values' do
    moved = array.swap!("a","c")
    expect(array).to eq(%w{c b a d e})
  end

  it 'swap works with indexes' do
    moved = array.swap(0,"c",true)
    expect(moved).to eq(%w{c b a d e})
  end

  it 'shifting moves element to the specified index and shifts the rest of the array forward' do
    moved = array.shifting(2,"e")
    expect(moved).to eq(%w{a b e c d})
    expect(moved).to_not eq(array)
  end

  it 'shifting! moves element to the specified index and shifts the rest of the array forward permanently' do
    moved = array.shifting!(2,"e")
    expect(array).to eq(%w{a b e c d})
  end

  it 'shifting works with negative index' do
    moved = array.shifting(-1,"a")
    expect(moved).to eq(%w{b c d e a})
  end
end
