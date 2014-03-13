class CheckBoxesEmLabelInput < SimpleForm::Inputs::CollectionCheckBoxesInput

  # Creates a radio button set for use with Semantic UI

  def input
    label_method, value_method = detect_collection_methods
    iopts = { 
      :item_wrapper_tag => 'label',
     }
    return @builder.send(
      "collection_check_boxes",
      attribute_name,
      collection,
      value_method,
      label_method,
      iopts,
      input_html_options,
      &collection_block_for_nested_boolean_style
    )
  end # method

  protected

  def build_nested_boolean_style_item_tag(collection_builder)
    collection_builder.check_box + ("<em>" + collection_builder.text + "</em>").html_safe
  end # method

end # class







