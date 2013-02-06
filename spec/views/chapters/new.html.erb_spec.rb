require 'spec_helper'

describe "chapters/new" do
  before(:each) do
    assign(:chapter, stub_model(Chapter,
      :title => "MyString",
      :order_by => 1,
      :body => "MyText",
      :experience_id => 1
    ).as_new_record)
  end

  it "renders new chapter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => chapters_path, :method => "post" do
      assert_select "input#chapter_title", :name => "chapter[title]"
      assert_select "input#chapter_order_by", :name => "chapter[order_by]"
      assert_select "textarea#chapter_body", :name => "chapter[body]"
      assert_select "input#chapter_experience_id", :name => "chapter[experience_id]"
    end
  end
end
