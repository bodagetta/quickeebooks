require "quickeebooks"
require "quickeebooks/windows/model/sync_status_drill_down"


module Quickeebooks
	module Windows
    	module Model
    		class SyncStatus < Quickeebooks::Windows::Model::IntuitType

		        XML_COLLECTION_NODE = 'SyncActivityResponses'
		        XML_NODE = 'SyncActivityResponse'
		        
		        # https://services.intuit.com/sb/syncActivity/v2/<realmID>
		        REST_RESOURCE = "syncActivity"
		        
		        xml_convention :camelcase
		        xml_accessor :sync_type, :from => 'SyncType'
		        xml_accessor :start_sync_tms, :from => 'StartSyncTMS'
		        xml_accessor :end_sync_tms, :from => 'EndSyncTMS'
		        xml_accessor :entity_name, :from => 'EntityName'
		        xml_accessor :entity_row_count, :from => 'EntityRowCount'
		        xml_accessor :sync_status_drill_down, :from => 'SyncStatusDrillDown', :as => Quickeebooks::Windows::Model::SyncStatusDrillDown

		    end
	    end
    end
end



     