# author: Kevin Formsma

class TaggableRDSBase < RDSBase
  def has_tag?(tag_key = nil, value = nil)
    tags = @resource.tags
    # c.list_tags_for_resource(resource_name: "arn:aws:rds:us-east-1:086761730243:db:dba-test-postgres").tag_list.map {|x| x['key']}
    # puts tags.size
    return tags.size > 0 if tag_key.nil?
    tags.each do |tag|
      if tag.key == tag_key
        return value.nil? || tag.value == value
      end
    end
    false
  end
end
