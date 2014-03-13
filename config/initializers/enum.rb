module Enum
  module Property
    TYPES = {
      options: [:assisted_living, :independant_living, :residential_care, :memory_care_specialty, :ccrc]
    }

    FUNDING_ACCEPTEDS = {
      options: [:medicare, :medicald, :ssi, :ltc_insurance, :va_benefits, :subsidized_housing]
    }

    CARE_SERVICES     = {
      options: [:hospice_care, :palliatative_care, :dementia_care, :rehabilitation_care, :accepts_bedridden, :diabetic_management, :administer_injections, :incontinence_care, :colostomy_care, :catherer_care, :oxygen_care, :i_v_care, :g_tube_care, :wound_care ]
    }

    FEATURE_AND_AMENITIES = {
      options: [:planned_activities, :pets_allowed, :internet_access, :cable_tv, :transportation_service, :fitness_room, :pool_or_hot_tub, :alarmed_exits]
    }
    DINNINGS = {
      options: [:flexible_meal_times, :vegetarian_menu, :kosher_menu, :special_diets, :religious_services]
    }

    CAREGIVERS_LANGUAGES = {
      options: [:armenian, :chinese_cantonese, :chinese_mandarin, :filipino, :french, :german, :hispanic, :italian, :japanese, :korean,:other,  :polish, :portuguese, :romanian, :russian, :spanish, :swedish, :tagalog, :taiwanese, :vietnamese]
    }

    RESIDENT_ETHNICS  = {
      options: [:japanese, :armenian, :chinese, :filipino, :hispanic, :korean, :taiwanese, :vietnamese, :other]
    }

  end
end