require 'spec_helper'

RSpec.shared_examples '#raw_to_a' do |query|
  let(:subject) { query.raw_to_a }
  let(:attributes) do
    if query.respond_to?(:select_values) && !query.select_values.empty?
      query.select_values.map(&:to_s).sort
    else
      query.columns.map(&:name).sort
    end
  end

  it 'is an array of hashes' do
    expect(subject).to be_an(Array)
    subject.each do |row|
      expect(row).to be_a(Hash)
    end
  end

  it 'has the same columns as the query' do
    subject.each do |row|
      expect(row.keys.sort).to eq(attributes)
    end
  end

  it 'has the same number of elements as the query' do
    expect(subject.size).to eq(query.all.size)
  end
end

RSpec.describe RawToA do
  it 'has a version number' do
    expect(RawToA::VERSION).not_to be nil
  end

  context 'with a model class' do
    include_examples '#raw_to_a', User
  end

  context 'with an ActiveRelation' do
    include_examples '#raw_to_a', User.where(active: true)
  end

  context 'when selecting specific columns' do
    include_examples '#raw_to_a', User.select(:username, :id)
  end

  context 'when limiting the number of rows' do
    include_examples '#raw_to_a', User.limit(3)
  end
end
