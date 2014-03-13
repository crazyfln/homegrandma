class AddAcceptSsiAndIncludeServiceChargeToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :include_service_charge, :boolean, default: false
    add_column :properties, :accept_ssi, :boolean, default: false
  end
end
