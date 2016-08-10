class FoundationFormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::TextHelper

  attr_accessor :output_buffer

  def text_field(attribute, options={})
    options[:label] ||= attribute
    label_text ||= options.delete(:label).to_s.titlecase
    wrapper do
      label(attribute, label_text) +
      super(attribute, options)
    end
  end

  def submit(text, options={})
    options[:class] ||= "button radius expand"
    wrapper do
      super(text, options)
    end
  end

  def wrapper(options={}, &block)
    content_tag(:div, class: "row") do
      content_tag(:div, capture(&block), class: "small-12 columns")
    end
  end

end