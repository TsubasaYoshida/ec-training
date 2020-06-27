# frozen_string_literal: true

SimpleForm.setup do |config|
  config.wrappers :default, class: 'form-group' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, error_class: 'is-invalid', valid_class: 'is-valid'
    b.use :input, class: 'input-text', error_class: 'is-invalid', valid_class: 'is-valid'
    b.use :hint, wrap_with: { tag: :small, class: :hint }
    b.use :full_error, wrap_with: { tag: :div, class: :'error-message' }
  end

  config.wrappers :checkbox, class: 'form-group' do |b|
    b.use :html5
    b.use :label_input, class: :checkbox, error_class: 'is-invalid', valid_class: 'is-valid'
    b.use :full_error, wrap_with: { tag: :div, class: :'error-message' }
  end

  config.default_wrapper = :default
  config.browser_validations = false
  config.button_class = :button
  config.required_by_default = false
end
