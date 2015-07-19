require_relative '../../billski_application.rb'
require_relative 'feature_helper'

describe 'root', type: :feature do
  it 'responds with successful status' do
    visit '/'
    expect(status_code).to eq 200
  end
end

describe 'sinatra json providers', type: :feature do
  # Because in the cache tests a file is cached, we need clear the
  # cache here since it is preserved when running the suite
  before(:all) { Billski::Cache.clear }
  before { visit subject  }

  describe '/bill/' do
    it 'returns the full bill' do
      expect(page).to have_content('statement')
    end
  end

  describe '/statement/' do
    it 'returns the statement section' do
      expect(page).to have_content('generated')
      expect(page).not_to have_content('statement')
    end
  end

  describe '/total/' do
    it 'returns the bill total' do
      expect(page).to have_content('136.03')
      expect(page).not_to have_content('statement')
    end
  end

  describe '/call_charges/' do
    it 'returns the callCharges section' do
      expect(page).to have_content('07716393769')
      expect(page).not_to have_content('statement')
    end
  end

  describe '/sky_store/' do
    it 'returns the skyStore section' do
      expect(page).to have_content('rentals')
      expect(page).not_to have_content('statement')
    end
  end
end
