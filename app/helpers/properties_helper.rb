module PropertiesHelper
  def property_types_button(property)
    html_string = ""

    property.types.each do |type|
      html_string += content_tag :div, class: "#{property_type_code(type)[:css]} content-color-box" do
        content_tag :h5 do
          property_type_code(type)[:code]
        end
      end
    end

    html_string.html_safe
  end

  def property_type_code(type)
    types = {
      'assisted_living'         => {:code => 'AL',  :css => 'color-box1',   :color => "green"},
      'independant_living'      => {:code => 'IL',  :css => 'color-box2',   :color => "blue"},
      'residential_care'        => {:code => 'RC',  :css => 'color-box3',   :color => "pink"},
      'memory_care_specialty'   => {:code => 'MC', :css => 'color-box4',   :color => "orange"},
      'ccrc'                    => {:code => 'CCRC', :css => 'color-box5',  :color => "pink2"}
    }
    types[type]
  end


end