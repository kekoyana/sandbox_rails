# frozen_string_literal: true

RSpec.describe 'FactoryBot' do
  it 'FactoryBotが正しく定義されていること' do
    FactoryBot.lint verbose: true, traits: true
  end
end
