require 'spec_helper'

describe "Chapters" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:experience) { FactoryGirl.create(:experience) }

  before { sign_in user }

  describe "chapter creation" do
    before { visit experience_path(experience) }

    describe "with invalid information" do
      it "should not create a chapter" do
        expect { click_button "Add Chapter" }.not_to change(Chapter, :count)
      end
      # describe "error messages" do
      #   before { click_button "Add Chapter" }
      #   it { should have_content('error') }
      # end
    end

    describe "with valid information" do
      before do
        fill_in 'chapter_title', with: "The first step was buying a nice boat"
        fill_in 'chapter_body',  with: "I went to a store and sat in some"
      end

      it "should create a new chapter" do
        expect { click_button "Add Chapter" }.to change(Chapter, :count).by(1)
      end
    end
  end

end
