module ContactsSerializer 
    class ContactinfoSerializer < ActiveModel::Serializer
        has_one :user, serializer: AuthSerializer::AuthmeSerializer 
        attributes :id,:name,:email,:phone
    end  
  end
  