module ApplicationHelper

  # to include javascsript file to page
  def javascript(*args)
    content_for(:javascript) { javascript_include_tag(*args) }
  end

  # to call js function on document.ready
  def call_js_init(something_js)
    content_for :javascript do
      "<script type='text/javascript'>
          $(document).ready(function(){
            #{something_js}
          });
      </script>".html_safe
    end
  end

  def state_code_to_select
    return State.all.map{|s| [s.code, s.code]}
  end

  def facility_type_for_select
    Enum::Property::TYPES[:options].map{ |t| OpenStruct.new( {:name => t, :text => I18n.t("enumerize.property.types.#{t.to_s}")} )}
  end

  def caregivers_languages_for_select
    Enum::Property::CAREGIVERS_LANGUAGES[:options].map{ |t| OpenStruct.new( {:name => t, :text => I18n.t("enumerize.property.caregivers_languages.#{t.to_s}")} )}
  end

  def resident_ethnics_2_for_select
    Enum::Property::RESIDENT_ETHNICS[:options].map{ |t| OpenStruct.new( {:name => t, :text => I18n.t("enumerize.property.resident_ethnics.#{t.to_s}")} )}
  end

  def care_services_for_select
    Enum::Property::CARE_SERVICES[:options].map{ |t| OpenStruct.new( {:name => t, :text => I18n.t("enumerize.property.care_services.#{t.to_s}")}) }
  end

  def feature_and_amenities_for_select
    Enum::Property::FEATURE_AND_AMENITIES[:options].map{ |t| OpenStruct.new( {:name => t, :text => I18n.t("enumerize.property.feature_and_amenities.#{t.to_s}")}) }
  end

  def dinnings_for_select
    Enum::Property::DINNINGS[:options].map{ |t| OpenStruct.new( {:name => t, :text => I18n.t("enumerize.property.dinnings.#{t.to_s}")}) }
  end

  def check_boxes_collection_for_search(field_object, collections, attribute)
    content = ""
    i = 0
    collections.each do
      if i % 3 == 0
        j = 0
        content += "<div>"
        collections.drop(i).each do |c|
          break if j == 3
          content += "<label>"
          content += field_object.check_box attribute, { :multiple => true }, c.name
          content += c.text.to_s
          content += "</label>"
          j += 1
        end
        content += "</div>"
      end
      i += 1
    end
    return content.html_safe
  end


  def hash_to_hidden_fields(hash)
    cleaned_hash = hash.reject { |k, v| v.nil? }
    pairs        = cleaned_hash.to_query.split(Rack::Utils::DEFAULT_SEP)

    tags = pairs.map do |pair|
      key, value = pair.split('=', 2).map { |str| Rack::Utils.unescape(str) }
      hidden_field_tag(key, value)
    end

    tags.join("\n").html_safe
  end

  def mark_required(object, attribute, mark = "*")
    content_tag(:span, mark, class: "sup", style: "float:initial") if object.class.validators_on(attribute).map(&:class).include? ActiveRecord::Validations::PresenceValidator
  end

  def property_checkboxes_for_singlepage(collections, property_enum, limit=7, checked_checkboxes=[])
    content = ""
    checked_checkboxes = checked_checkboxes.to_a if !checked_checkboxes.kind_of?(Array)
    i = 0
    collections.each do
      if i % limit == 0
        j = 0
        content += "<ul>"
        collections.drop(i).each do |col|
          break if j == limit
          content += "<li>"
          content += "<label>"
          checked = ""
          checked = "checked=true" if checked_checkboxes.include?(col.to_s)
          content += "<input type=\"checkbox\" #{checked} disabled=\"true\">"
          content += I18n.t("enumerize.property.#{property_enum}.#{col}")
          content += "</label>"
          content += "</li>"
          j += 1
        end
        content += "</ul>"
      end
      i += 1
    end
    return content.html_safe
  end



end
