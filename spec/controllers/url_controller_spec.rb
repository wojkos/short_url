require 'rails_helper'

RSpec.describe UrlsController do
  describe 'POST create' do
    let(:valid_params) { {'url' => {'url_orginal' => 'http://wkostanski.pl'}} }
    let(:invalid_params) { {'url' => {'url_orginal' => 'wkostanski.pl'}} }
    it 'with valid params' do
      expect do
        post :create, params: valid_params
      end.to change(Url, :count).by(1)
    end
    it 'with invalid params' do
      expect do
        post :create, params: invalid_params
      end.to change(Url, :count).by(0)
    end
    it 'with duplicated params' do
      post :create, params: valid_params
      expect do
        post :create, params: valid_params
      end.to change(Url, :count).by(0)
    end
  end
end
