require File.dirname(__FILE__) + '/../spec_helper'
require 'active_project/rails_ext/prototype_flash_messages'

class JavaScriptGenerator
	include ActiveProject::RailsExt::PrototypeFlashMessages

	attr_accessor :hidden_blocks, :visual_effected_blocks, :replaced_blocks

	def initialize
		[:hidden_blocks, :visual_effected_blocks, :replaced_blocks].each { |attr| self.send("#{attr}=", []) }
	end

	def hide(*blocks)
		blocks.each { |b| self.hidden_blocks << b }
	end

	def visual_effect(visual_effect, block)
		self.visual_effected_blocks << block
	end

	def replace_html(block, options_for_render)
		self.replaced_blocks << [block, options_for_render || nil]
	end
end

describe 'ActiveProject::RailsExt::PrototypeFlashMessages#hide_message_blocks' do
	before(:each) do
		@js_generator = JavaScriptGenerator.new
	end

	it 'should hide regular and custom message blocks' do
		@js_generator.hide_message_blocks(['block'])		
		@js_generator.hidden_blocks.should eql([JavaScriptGenerator::ERROR_BLOCK_ID, JavaScriptGenerator::SUCCESS_BLOCK_ID, 'block-errors', 'block-success'])
	end

end

describe 'ActiveProject::RailsExt::PrototypeFlashMessages#show_message_block' do
	before(:each) do
		@js_generator = JavaScriptGenerator.new
	end

	it 'should toggle_appear block without options_for_render' do
		@js_generator.show_message_block('block')
		@js_generator.visual_effected_blocks.should eql(['block'])
	end

	it 'should call replace_html with string option and toggle_appear block' do
		@js_generator.show_message_block('block', 'text')
		
		@js_generator.visual_effected_blocks.should eql(['block'])
		@js_generator.replaced_blocks.should eql([['block', ['text']]])
	end

	it 'should call replace_html with :list option and toggle_appear block' do
		@js_generator.show_message_block('block', :list => ['error1', 'error2'])
		
		@js_generator.visual_effected_blocks.should eql(['block'])
		@js_generator.replaced_blocks.should eql([['block', '<ul><li>error1</li><li>error2</li></ul>']])
	end

end

describe 'ActiveProject::RailsExt::PrototypeFlashMessages#destroy' do
	before(:each) do
		@js_generator = JavaScriptGenerator.new
	end


	it 'should hide regular message blocks and fade given block' do
		@js_generator.destroy('block')

		@js_generator.hidden_blocks.should eql([JavaScriptGenerator::ERROR_BLOCK_ID, JavaScriptGenerator::SUCCESS_BLOCK_ID])
		@js_generator.visual_effected_blocks.should eql(['block'])
	end
end


describe 'ActiveProject::RailsExt::PrototypeFlashMessages#success' do
	before(:each) do
		@js_generator = JavaScriptGenerator.new
	end

	it 'should hide regular blocks and show success block' do
		@js_generator.success 'Success meassage'

		@js_generator.hidden_blocks.should eql([JavaScriptGenerator::ERROR_BLOCK_ID, JavaScriptGenerator::SUCCESS_BLOCK_ID])
		@js_generator.visual_effected_blocks.should eql([JavaScriptGenerator::SUCCESS_BLOCK_ID])
	end

	it 'should hide custom error/success blocks and show custom success block' do
		@js_generator.success 'Custom success meassage', {:success_block => 'ok_block', :error_block => 'err_block' }

		@js_generator.hidden_blocks.should eql(['err_block', 'ok_block'])
		@js_generator.visual_effected_blocks.should eql(['ok_block'])
	end
end


describe 'ActiveProject::RailsExt::PrototypeFlashMessages#error' do
	before(:each) do
		@js_generator = JavaScriptGenerator.new
	end

	it 'should hide regular blocks and show error block' do
		@js_generator.error 'Error meassage'

		@js_generator.hidden_blocks.should eql([JavaScriptGenerator::ERROR_BLOCK_ID, JavaScriptGenerator::SUCCESS_BLOCK_ID])
		@js_generator.visual_effected_blocks.should eql([JavaScriptGenerator::ERROR_BLOCK_ID])
	end

	it 'should hide custom error/success blocks and show custom error block' do
		@js_generator.error 'Custom error meassage', {:success_block => 'ok_block', :error_block => 'err_block' }

		@js_generator.hidden_blocks.should eql(['err_block', 'ok_block'])
		@js_generator.visual_effected_blocks.should eql(['err_block'])
	end
end