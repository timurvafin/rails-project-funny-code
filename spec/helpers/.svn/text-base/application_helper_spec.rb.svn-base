require File.dirname(__FILE__) + '/../spec_helper'

describe ApplicationHelper, " language_switcher" do

    before do
        GLoc.stub!(:valid_languages).and_return([:en, :ru])
    end

    it "should return link_to en when current_language is ru" do
        should_receive(:current_language).any_number_of_times.and_return(:ru)
        should_receive(:localized_root_path).with(:en).and_return('/en')
        
        should_receive(:link_to).with(l('en'), '/en')

        language_switcher
    end
end
